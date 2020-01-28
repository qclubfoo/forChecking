//
//  Model.swift
//  MVCwithCoreData
//
//  Created by admin on 23/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

//import CoreData
import UIKit

protocol ProductsModelProtocol {
    
    func getNumberOfRows() -> Int
    
    func getProductItem(atIndex index: Int) -> ProductProtocol
    
    func addProductItem(productWithName name: String?, cost: String?, quantity: String?)
    
    func editProductItem(atIndex index: Int, replaceName name: String?, cost: String?, quantity: String?)
    
    func deleteProductItem(atIndex index: Int)
}

class Model: ProductsModelProtocol {

    private var arrayOfProducts: [ProductProtocol] = CoreDataService.shared.fetchRequest(entityName: "Product")
    
    func getNumberOfRows() -> Int {
        return arrayOfProducts.count
    }
    
    func getProductItem(atIndex index: Int) -> ProductProtocol {
        return CoreDataService.shared.fetchProductItem(byIndex: index)
    }
    
    func addProductItem(productWithName name: String?, cost: String?, quantity: String?) {
        let data = (name, cost, quantity)
        CoreDataService.shared.addNewElement(withData: data)
        arrayOfProducts = fetchCoreData()
    }
    
    func editProductItem(atIndex index: Int, replaceName name: String?, cost: String?, quantity: String?) {
        let data = (name, cost, quantity)
        CoreDataService.shared.editProductItem(byIndex: index, withData: data)
        arrayOfProducts = fetchCoreData()
    }
    
    func deleteProductItem(atIndex index: Int) {
        CoreDataService.shared.deleteProductItem(byIndex: index)
        arrayOfProducts = fetchCoreData()
    }
    
    func fetchCoreData() -> [ProductProtocol] {
        return CoreDataService.shared.fetchRequest(entityName: "Product")
    }
    
   
}


