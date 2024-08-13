//
//  SearchVC.swift
//  SearchTutorial
//
//  Created by Kunal Kumar R on 06/08/24.
//

import UIKit

struct Student {
    let name: String
}

class SearchVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!
    let searchController = UISearchController()
    
    var dataArray: [Student] = []
    var filteredData = [Student]()
    let students = [
        Student(name: "Kunal"),
        Student(name: "Krish"),
        Student(name: "Kendall"),
        Student(name: "Kenny"),
        Student(name: "Kaashvi"),
        Student(name: "Kennedy"),
        Student(name: "Kris jenner"),
        Student(name: "King"),
        Student(name: "Kindergarden"),
        Student(name: "Kitty")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        searchTableView.delegate = self
        searchTableView.dataSource = self
        for student in students {
            dataArray.append(student)
        }
        initSearchController()
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive) {
            return filteredData.count
        }
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student: Student
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        if (searchController.isActive) {
            student = filteredData[indexPath.row]
        }else {
            student = dataArray[indexPath.row]
        }
        cell.titleLabel.text = student.name
        return cell
    }
    
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = true
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Popular", "Coming Soon", "Top Rated"]
    }
}

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let _ = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let _ = searchBar.text!
    }
    
    func filteredSearchForTextAndScopeButton(searchText: String, scopeButton: String = "All") {
        filteredData = dataArray.filter { student in
            let scopeMatch = (scopeButton == "All" || student.name.lowercased().contains(searchText.lowercased()))
            if (searchController.searchBar.text != nil) {
                let searchTextResult = student.name.lowercased().contains(searchText.lowercased())
                return scopeMatch && searchTextResult
            }else {
                return scopeMatch
            }
        }
        searchTableView.reloadData()
    }
}

