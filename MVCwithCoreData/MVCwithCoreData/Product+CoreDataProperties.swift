//
//  Products+CoreDataProperties.swift
//  MVCwithCoreData
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Products")
    }

    @NSManaged public var name: String
    @NSManaged public var cost: Double
    @NSManaged public var quantity: Int16
    
    convenience init(insertInto context: NSManagedObjectContext, entity: NSEntityDescription, name: String, cost: Double, quantity: Int16) {
        self.init(entity: entity, insertInto: context)
        self.name = name
        self.cost = cost
        self.quantity = quantity
    }

}
