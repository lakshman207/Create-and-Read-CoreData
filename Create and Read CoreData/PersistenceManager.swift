//
//  PersistenceManager.swift
//  Create and Read CoreData
//
//  Created by Home Computer on 04/12/2019.
//  Copyright © 2019 Home Computer. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
    
    private init() { }
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "Create_and_Read_CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    
    func save() { 
        if context.hasChanges {
            do {
                try context.save()
                print("Saved Successfully")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }

        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing:  objectType)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let fetchedObjects =  try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
            
            
        } catch {
            print(error)
            return[T]()
        }
        
    }
    
    
}
