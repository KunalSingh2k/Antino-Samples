//
//  RecordWhistleViewController.swift
//  CloudKitSample
//
//  Created by Kunal Kumar R on 14/08/24.
//

import UIKit
import AVFoundation

class RecordWhistleViewController: UIViewController, AVAudioRecorderDelegate {
    var stackView: UIStackView!
    var recordButton: UIButton!
    var playButton: UIButton!
    var recordingSession: AVAudioSession!
    var whistleRecorder: AVAudioRecorder!
    var whistlePlayer: AVAudioPlayer!
    
    //MARK: - Load View Method
    /// haa a stack view with vertical axis
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .gray
        
        stackView = UIStackView()
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

    //MARK: - View Did Load Method
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Record your whistle"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Record", style: .plain, target: nil, action: nil)
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            AVAudioApplication.requestRecordPermission { [unowned self] allowed in
                if allowed {
                    loadRecordingUI()
                }else {
                    loadFailUI()
                }
            }
        }catch {
            loadFailUI()
        }
    }
}

extension RecordWhistleViewController {
    
    //MARK: - loadRecordingUI Method
    func loadRecordingUI() {
        // Record Button
        recordButton = UIButton()
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.setTitle("Tap to record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        stackView.addArrangedSubview(recordButton)
        
        // Play Button
        playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Tap to play", for: .normal)
        playButton.isHidden = true
        playButton.alpha = 0
        playButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        stackView.addArrangedSubview(playButton)
    }
    
    //MARK: - Record tapped method
    @objc func recordTapped() {
        if whistleRecorder == nil {
            startRecording()
            
            if !playButton.isHidden {
                UIView.animate(withDuration: 0.35) { [unowned self] in
                    self.playButton.isHidden = true
                    self.playButton.alpha = 0
                }
            }
        }else {
            finishRecording(success: true)
        }
    }
    
    //MARK: - Play Tapped Method
    @objc func playTapped() {
        let audioURL = RecordWhistleViewController.getWhistleURL()
        
        do {
            whistlePlayer = try AVAudioPlayer(contentsOf: audioURL)
            whistlePlayer.play()
        }catch {
            showAlert(title: "Playback failed", message: "There was a problem playing your whistle; please try re-recording.")
        }
    }
    
    //MARK: - StartRecordingMethod
    func startRecording() {
        view.backgroundColor = UIColor(red: 0.6, green: 0, blue: 0, alpha: 1)
        recordButton.setTitle("Tap to stop", for: .normal)
        
        // AudioURL
        let audioURL = RecordWhistleViewController.getWhistleURL()
        print(audioURL.absoluteString)
        
        // Audio settings
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            whistleRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            whistleRecorder.delegate = self
            whistleRecorder.record()
        }catch {
            finishRecording(success: false)
        }
    }

    //MARK: - loadFailUI Method
    func loadFailUI() {
        let failLabel = UILabel()
        failLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        failLabel.text = "Recording failed: Please ensure the app has permissons to access your microphone."
        failLabel.numberOfLines = 0
        stackView.addArrangedSubview(failLabel)
    }
}

extension RecordWhistleViewController {
    //MARK: - class level method getDocumentsDirectory
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    //MARK: - class level method getWhistleURL
    class func getWhistleURL() -> URL {
        getDocumentsDirectory().appendingPathComponent("whistle.m4a")
    }
    
    //MARK: - AVAudio Delegate Method
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    //MARK: - Finish recording Method
    func finishRecording(success: Bool) {
        view.backgroundColor = UIColor(red: 0, green: 0.6, blue: 0, alpha: 1)
        
        whistleRecorder.stop()
        whistleRecorder = nil
        
        if playButton.isHidden {
            UIView.animate(withDuration: 0.35) { [unowned self] in
                self.playButton.isHidden = false
                self.playButton.alpha = 1
            }
        }
        
        if success {
            recordButton.setTitle("Tap to re-record", for: .normal)
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
        }else {
            recordButton.setTitle("Tap to record", for: .normal)
            showAlert(title: "Record failed", message: "There was a problem recording your voice, please try again.")
        }
    }
    
    //MARK: - Next Tapped Method
    @objc func nextTapped() {
        // Push VC
    }
}

//MARK: - Show Alert Method
extension RecordWhistleViewController {
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message ?? nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
