//
//  ViewController.swift
//  HitList
//
//  Created by ilya on 25.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let identifierCell = "Cell"
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Список"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDeleagate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDeleagate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Не могу прочитать. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Новое имя", message: "Добавьте новое имя", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [unowned self] (action) in
            guard
                let textField = alert.textFields?.first,
                let nameToSave = textField.text
            else { return }
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func save(name: String) {
        guard let appDeleagate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDeleagate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Не могу записать. \(error), \(error.userInfo)")
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        cell.textLabel?.text = person.value(forKey: "name") as? String
        return cell
    }
    
}
