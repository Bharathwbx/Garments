//
//  CoreDataManager.swift
//  ShoppingItems
//
//  Created by Bharatraj Rai on 4/16/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShoppingModel")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        return container
    }()
    
    func fetchGarments(sortBy attribute: String) -> [Garment] {
        let context = persistenceContainer.viewContext
        let fetchRequest = NSFetchRequest<Garment>(entityName: "Garment")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: attribute, ascending: true)]
        do {
            let garments = try context.fetch(fetchRequest)
            return garments
        } catch let err {
            print("Failed to fetch garments:", err)
        }
        return []
    }
    
    
}
