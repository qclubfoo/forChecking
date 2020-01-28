//
//  CoreData.swift
//  MVCwithCoreData
//
//  Created by admin on 23/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import CoreData

class CoreDataService {
    
    static let shared = CoreDataService()
    
    private init() {}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MVCwithCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Constants
    
    lazy var managedContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                print("catch an error during save")
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addNewElement(withData data:(name: String?, cost: String?, quantity: String?)) {
        guard let entity = entityByName("Product") else { return }
        let product = Product(entity: entity, insertInto: managedContext)
        let name = data.name ?? "New product"
        let cost = Double(data.cost ?? "0") ?? 0
        let quantity = Int16(data.quantity ?? "0") ?? 0
        product.name = name
        product.cost = cost
        product.quantity = quantity
        saveContext()
    }
    
    func editProductItem(byIndex index: Int, withData data:(name: String?, cost: String?, quantity: String?)) {
        let product = fetchProductItem(byIndex: index)
        let name = data.name ?? product.name
        let cost = Double(data.cost ?? String(product.cost)) ?? product.cost
        let quantity = Int16(data.quantity ?? String(product.quantity)) ?? product.quantity
        product.name = name
        product.cost = cost
        product.quantity = quantity
        saveContext()
    }
    
    func entityByName(_ entityName: String) -> NSEntityDescription? {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)
        return entity
    }
    
    // MARK: - Core Data deleting support
    
    func deleteProductItem(byIndex index: Int) {
        let person = fetchProductItem(byIndex: index)
        managedContext.delete(person)
        saveContext()
    }
    
    // MARK: - Core Data Fetching support
    
    func fetchRequest(entityName: String) -> [Product] {
        var products: [Product] = [Product]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        do {
            products = try (persistentContainer.viewContext.fetch(fetchRequest) as? [Product] ?? [])
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        return products
    }
    
    func fetchProductItem(byIndex index: Int) -> Product {
        let products = fetchRequest(entityName: "Product")
        return products[index]
    }
    
    func countProducts() -> Int {
        let products = fetchRequest(entityName: "Product")
        return products.count
    }

}
