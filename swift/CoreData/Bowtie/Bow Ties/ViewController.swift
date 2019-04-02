//
//  ViewController.swift
//  Bow Ties
//
//  Created by Sergey Dunaev on 22/10/2018.
//  Copyright © 2018 Sergey Dunaev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timesWornLabel: UILabel!
    @IBOutlet weak var lastWornLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var managedContext: NSManagedObjectContext!
    var currentBowtie: Bowtie!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertSampleData()
        
        let request: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()
        let firstTitle = segmentedControl.titleForSegment(at: 0)!
        request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Bowtie.searchKey), firstTitle])
        do {
            let result = try managedContext.fetch(request)
            currentBowtie = result.first
            populate(bowtie: result.first!)
        } catch let error as NSError {
            print("Не могу получить выборку: \(error), \(error.userInfo)")
        }
    }
    
    // MARK: - IBActions
    @IBAction func segmentedControl(_ sender: Any) {
        guard
            let control = sender as? UISegmentedControl,
            let selectedValue = control.titleForSegment(at: control.selectedSegmentIndex)
        else { return }
        
        let request: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()
        request.predicate = NSPredicate(format: "%K = %@",
                                        argumentArray: [#keyPath(Bowtie.searchKey), selectedValue])
        
        do {
            let result = try managedContext.fetch(request)
            currentBowtie = result.first
            populate(bowtie: currentBowtie)
        } catch let error as NSError {
            print("Не могу получить выборку: \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func wear(_ sender: Any) {
        let times = currentBowtie.timesWorn
        currentBowtie.timesWorn = times + 1
        currentBowtie.lastWorn = Date() as NSDate
        
        do {
            try managedContext.save()
            populate(bowtie: currentBowtie)
        } catch let error as NSError {
            print("Не могу получить выборку: \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func rate(_ sender: Any) {
        let alert = UIAlertController(title: "Новыйй рейтинг", message: "Рейтинг для этой бабочки", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [unowned self] action in
            if let textField = alert.textFields?.first {
                self.update(rating: textField.text)
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true)
    }
    
    func update(rating: String?) {
        guard
            let ratingString = rating,
            let rating = Double(ratingString)
        else { return }
        
        do {
            currentBowtie.rating = rating
            try managedContext.save()
            populate(bowtie: currentBowtie)
        } catch let error as NSError {
            if error.domain == NSCocoaErrorDomain &&
                (error.code == NSValidationNumberTooLargeError ||
                    error.code == NSValidationNumberTooSmallError) {
                rate(currentBowtie)
            }
            print("Не могу Записать: \(error), \(error.userInfo)")
        }
        
    }
    
    func populate(bowtie: Bowtie) {
        guard
            let imageData = bowtie.photoData as Data?,
            let lastWorn = bowtie.lastWorn as Date?,
            let tintColor = bowtie.tintColor as? UIColor
        else { return }
        
        imageView.image = UIImage(data: imageData)
        nameLabel.text = bowtie.name
        ratingLabel.text = "Рэйтинг: \(bowtie.rating)/5"
        
        timesWornLabel.text = "# раз носил: \(bowtie.timesWorn)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        lastWornLabel.text = "Последний раз надевал: \(dateFormatter.string(from: lastWorn))"
        favoriteLabel.isHidden = !bowtie.isFavorite
        view.tintColor = tintColor
    }

    func insertSampleData() {
        let fetch: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()
        fetch.predicate = NSPredicate(format: "searchKey != nil")
        
        let count = try! managedContext.count(for: fetch)
        if count > 0 {
            return
        }
        
        let path = Bundle.main.path(forResource: "SampleData", ofType: "plist")!
        let dataArray = NSArray(contentsOfFile: path)!

        for dict in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext)!
            let bowtie = Bowtie(entity: entity, insertInto: managedContext)
            let bdDict = dict as! [String: Any]
            
            bowtie.id = UUID(uuidString: bdDict["id"] as! String)
            bowtie.name = bdDict["name"] as? String
            bowtie.searchKey = bdDict["searchKey"] as? String
            bowtie.rating = bdDict["rating"] as! Double
            let colorDict = bdDict["tintColor"] as! [String: Any]
            bowtie.tintColor = UIColor.color(dict: colorDict)
            
            let imageName = bdDict["imageName"] as? String
            let image = UIImage(named: imageName!)
            let photoData = image!.pngData()!
            bowtie.photoData = NSData(data: photoData)
            bowtie.lastWorn = bdDict["lastWorn"] as? NSDate
            
            let timesNumber = bdDict["timesWorn"] as! NSNumber
            bowtie.timesWorn = timesNumber.int32Value
            bowtie.isFavorite = bdDict["isFavorite"] as! Bool
            bowtie.url = URL(string: bdDict["url"] as! String)
        }
        
        try! managedContext.save()
    }
    
}

private extension UIColor {
    static func color(dict: [String: Any]) -> UIColor? {
        guard
            let red = dict["red"] as? NSNumber,
            let green = dict["green"] as? NSNumber,
            let blue = dict["blue"] as? NSNumber
            else { return nil }
        
        return UIColor(red: CGFloat(truncating: red) / 255,
                       green: CGFloat(truncating: green) / 255,
                       blue: CGFloat(truncating: blue) / 255,
                       alpha: 1)
    }
}

