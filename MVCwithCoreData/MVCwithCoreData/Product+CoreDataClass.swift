//
//  Products+CoreDataClass.swift
//  MVCwithCoreData
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//
//

import Foundation
import CoreData

protocol ProductProtocol {
    var name: String { get }
    var cost: Double { get }
    var quantity: Int16 { get }
}

@objc(Product)
public class Product: NSManagedObject, ProductProtocol {

}
