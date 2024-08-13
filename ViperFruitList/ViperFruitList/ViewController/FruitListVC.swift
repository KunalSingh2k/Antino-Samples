//
//  FruitListVC.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import UIKit

class FruitListVC: UIViewController, FruitListViewProtocol {
    @IBOutlet weak var fruitsTableView: UITableView!
    
    var presenter: FruitListPresenterProtocol?
    var fruitList = [Fruit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fruitsTableView.delegate = self
        fruitsTableView.dataSource = self
        FruitListWireFrame.createFruitListModule(fruitListRef: self)
        presenter?.viewDidLoad()
    }
    
    func showFruits(has fruits: [Fruit]) {
        fruitList = fruits
        fruitsTableView.reloadData()
    }
}


extension FruitListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fruitsTableView.dequeueReusableCell(withIdentifier: "FruitsTableViewCell", for: indexPath) as! FruitsTableViewCell
        let fruit = fruitList[indexPath.row]
        cell.nameLabel.text = fruit.name
        cell.vitaminLabel.text = fruit.vitamin
        return cell
    }
}
