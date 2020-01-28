//
//  AvilableClasses.swift
//  BooksAndMagazines
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct Book {
    let name: String
    let author: String
}

extension Book: DisplayInfoProtocol {
    var labelOne: String {
        "Book name: " + name
    }

    var labelTwo: String {
        "Author is: " + author
    }
}

struct Magazine {
    let name: String
    let dateOfProduce: Int
}

extension Magazine: DisplayInfoProtocol {
    var labelOne: String {
        "Magazine name: " + name
    }
    
    var labelTwo: String {
        "Date of publish: " + String(dateOfProduce)
    }
}
