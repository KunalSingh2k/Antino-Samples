//
//  ViewController.swift
//  TestingSample
//
//  Created by Kunal Kumar R on 14/08/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wordsTableView: UITableView!
    var playData = PlayData()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordsTableView.dataSource = self
        wordsTableView.delegate = self
        title = "Words"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    @objc func searchTapped() {
        let alert = UIAlertController(title: "Filter..", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let filterAction = UIAlertAction(title: "Filter", style: .default) { [unowned self] _ in
            let userInput = alert.textFields?[0].text ?? "0"
            playData.applyUserFilter(userInput)
            wordsTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(filterAction)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playData.filteredWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WordsTableViewCell
        let word = playData.filteredWords[indexPath.row]
        cell.titleLabel.text = word
        cell.detailLabel.text = "Used \(playData.wordCounts.count(for: word)) times"
        return cell
    }
}
