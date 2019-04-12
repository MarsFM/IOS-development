//
//  CoredataStack.swift
//  ChessGameApp
//
//  Created by ilya on 11.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("\(error)\(error.userInfo)")
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
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
