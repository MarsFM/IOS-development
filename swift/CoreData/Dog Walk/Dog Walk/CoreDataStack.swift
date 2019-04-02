//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by ilya on 26.03.2019.
//  Copyright © 2019 Sergey Dunaev. All rights reserved.
//

import Foundation
import CoreData

class CoreDataSatck {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("\(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        return storeContainer.viewContext
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
    }
    
}
