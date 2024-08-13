//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Kunal Kumar R on 09/08/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var namesTableView: UITableView!
    var names: [NSManagedObject] = []
    var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Managed Context
        let managedContext = appDelegate.persistentContainer.viewContext
        // Fetch Request
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        // Fetch
        do {
            names = try managedContext.fetch(fetchRequest)
        }catch {
            print("Error Fetching Data", error.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        namesTableView.delegate = self
        namesTableView.dataSource = self
        title = "Register"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.reuseIdentifier, for: indexPath) as! NameTableViewCell
        let name = names[indexPath.row]
        cell.nameLabel.text = name.value(forKeyPath: "name") as? String
        return cell
    }
    
    @objc func addButtonPressed() {
        showAlert(title: "New Name", message: "Add a new name")
    }
}

//MARK: - Core Data Save()
extension ViewController {
    func save(name: String) {
        // Managed Context
        let managedContext = appDelegate.persistentContainer.viewContext
        // Entity
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        // Entity Object
        let personName = NSManagedObject(entity: entity, insertInto: managedContext)
        // Save
        personName.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            names.append(personName)
        }catch {
            print("Couldn't Save", error.localizedDescription)
        }
        
    }
}

