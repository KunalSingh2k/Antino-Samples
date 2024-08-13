//
//  LandingVC.swift
//  WordScramble
//
//  Created by Kunal Kumar R on 22/07/24.
//

import UIKit

class LandingVC: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let wordPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            if let words = try? String(contentsOfFile: wordPath) {
                allWords = words.components(separatedBy: "\n")
            }
        }else {
            allWords = ["Silkworm"]
        }
        startGame()
    }
}

extension LandingVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordsTableViewCell", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    // Start game function
    func startGame() {
        title = allWords.randomElement()
        //
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    // Objc function
    @objc func promptForAnswer() {
        let alert = UIAlertController(title: "Enter your answer", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned self, alert] action in
            // Closure statements
            let answer = alert.textFields![0]
            self.submit(answer.text!)
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
    // Submit method
    func submit(_ answer: String) {
        let lowercasedAnswer = answer.lowercased()
        
        if isPossible(lowercasedAnswer) {
            if isOriginal(lowercasedAnswer) {
                if isReal(lowercasedAnswer) {
                    usedWords.insert(answer, at: 0)
                    
                    let indexpath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexpath], with: .automatic)
                    return
                }else {
                    showAlert("Word not recognized", "You can't just make them up!")
                }
            }else {
                showAlert("Word used already", "Be more original!")
            }
        }else {
            guard let title = title?.lowercased() else { return }
            showAlert("Word not possible", "You can't spell that word from \(title)")
        }
    }
}

// Word condition extension
extension LandingVC {
    // Check whether the input string is valid and not repeated.
    func isPossible(_ word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = tempWord.range(of: String(letter)){
                tempWord.remove(at: position.lowerBound)
            }else {
                return false
            }
        }
        return true
    }
    
    func isOriginal(_ word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isReal(_ word: String) -> Bool {
        guard !word.isEmpty, word.count > 3, word != title?.lowercased() else {
            if word.isEmpty || word.count <= 3 || word == title?.lowercased() {
                showAlert("Incorrect", "Enter something intresting..")
            }
            return false
        }
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
}


// Alert extension
extension LandingVC {
    // Alert
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
