//
//  ViewController.swift
//  ImageFilterSample
//
//  Created by Kunal Kumar R on 08/08/24.
//

import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intensity: UISlider!
    var currentImage: UIImage!
    var context: CIContext!
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importImage))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deletePressed))
        
        context = CIContext()
        filter = CIFilter(name: "CISepiaTone")
    }
    
    @IBAction func changeFilterButtonPressed(_ sender: UIButton) {
        guard let _ = imageView.image else {
            showAlert(title: "Oops!", message: "There is no image to use filter...")
            return
        }
        showFilterAlert()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let image = imageView.image else {
            showAlert(title: "Oops!", message: "There is no image to save...")
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        imageView.image = nil
    }
    
    @IBAction func intensityChanged(_ sender: Any) {
        applyProcessing()
    }
}

extension ViewController {
    //Image Picker Controller
    @objc func importImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    //MARK: UIImagePickerController Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
        
        let imageBeforeEditing = CIImage(image: currentImage)
        filter.setValue(imageBeforeEditing, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    //Apply Filter
    func applyProcessing() {
        let inputKeys = filter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { filter.setValue(intensity.value, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { filter.setValue(intensity.value * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { filter.setValue(intensity.value * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputCenterKey) { filter.setValue(CIVector(x: currentImage.size.width/2, y: currentImage.size.height/2), forKey: kCIInputCenterKey) }
        
        
        if let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
            let imageAfterEditing = UIImage(cgImage: cgImage)
            imageView.image = imageAfterEditing
        }
    }
    
    //Set Filter
    func setFilter(action: UIAlertAction) {
        guard currentImage != nil else { return }
        
        guard let actionTitle = action.title else { return }
        
        filter = CIFilter(name: actionTitle)
        
        let initialImage = CIImage(image: currentImage)
        filter.setValue(initialImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
}

extension ViewController {
    func showFilterAlert() {
        let alert = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            showAlert(title: "Save Error!", message: error.localizedDescription)
        }else {
            showAlert(title: "Saved Successfully!", message: "Your Image has been saved to photos library")
        }
    }
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

//MARK: - Delete pressed
extension ViewController {
    @objc func deletePressed() {
         imageView.image = nil
    }
}
