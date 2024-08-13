//
//  ViewController.swift
//  WhiteHousePetitions
//
//  Created by Kunal Kumar R on 23/07/24.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions: [Petition] = []
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(credits))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(filter))
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        }else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        parseJson()
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard filteredPetitions.isEmpty else {
            return filteredPetitions.count
        }
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailPetition = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // Json parsing
    func parseJson() {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                self.showAlert("Error!", "Error while loading the json")
                return
            }
            guard let data = data else {
                self.showAlert("Invalid Data", "Oops..no data found")
                return
            }
            do {
                let petitionResponse = try JSONDecoder().decode(Petitions.self, from: data)
                self.petitions = petitionResponse.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch {
                self.showAlert("Decoding error", "Failed to decode Json")
            }
        }
        task.resume()
    }
    
    // Alert
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // Credits Mehthod
    @objc func credits() {
        showAlert("Credits", "The data comes from We The People API of the Whitehouse")
    }
    
    @objc func filter() {
        let filterAlert = UIAlertController(title: "Filter", message: "Filter according to your preferences", preferredStyle: .alert)
        filterAlert.addTextField()
        let showResultsAction = UIAlertAction(title: "Show results", style: .default) { [weak self, filterAlert] action in
            // Closure
            let filterWord = filterAlert.textFields![0]
            self?.filteredWord(filterWord.text!)
        }
        filterAlert.addAction(showResultsAction)
        present(filterAlert, animated: true)
    }
    
    func filteredWord(_ word: String) {
        for petition in petitions{
            if petition.title.contains(word) || petition.body.contains(word) {
                filteredPetitions.append(petition)
                tableView.reloadData()
            }
        }
    }
}
