//
//  AvilableClasses.swift
//  BooksAndMagazines
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct Book: Codable {
    let name: String
    let author: String
    let aboutBook: String?
}

extension Book: DisplayInfoProtocol {
    var wallPaper: String {
        "booksWallpaper"
    }
    
    var navControllerLable: String {
        "Books"
    }

    var about: String? {
        aboutBook
    }
    
    var nameLabel: String {
        "Book name: " + name
    }

    var detailLable: String {
        "Author is: " + author
    }
}

struct Magazine: Codable {
    let name: String
    let dateOfProduce: Int
    let aboutMagazine: String?
}

extension Magazine: DisplayInfoProtocol {
    var wallPaper: String {
        "magazinesWallpaper"
    }
    
    var navControllerLable: String {
        "Magazines"
    }
    
    var about: String? {
        aboutMagazine
    }
    
    var nameLabel: String {
        "Magazine name: " + name
    }
    
    var detailLable: String {
        "Date of publish: " + String(dateOfProduce)
    }
}
