//
//  Model.swift
//  BooksAndMagazines
//
//  Created by admin on 28/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class BooksModel {
    private var arrayOfBooks = [Book]()
    
    func getBooks() -> [Book] {
        self.arrayOfBooks = JSONService.shared.getBooksFromJSON()
        return arrayOfBooks
    }
}

class MagazinesModel {

    private var arrayOfMagazines = [Magazine]()
    
    func getMagazines() -> [Magazine] {
        self.arrayOfMagazines = JSONService.shared.getMagazinesFromJSON()
        return arrayOfMagazines
    }
}
