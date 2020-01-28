//
//  JSONService.swift
//  BooksAndMagazines
//
//  Created by admin on 28/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class JSONService {
    
    static let shared = JSONService()
    
    private init() {}
    
    func getBooksFromJSON() -> [Book] {
                let urlString = "https://firebasestorage.googleapis.com/v0/b/ridescount.appspot.com/o/books.json?alt=media&token=f91e023b-484c-421b-9f8c-3747ab7f284b"
                let url = URL(string: urlString)!
                    do {
                        let data = try Data(contentsOf: url, options: .alwaysMapped)
                        let decoder = JSONDecoder()
                        let modelArray = try decoder.decode([Book].self, from: data)
                        return modelArray
                    } catch let parsingError {
                        print("Error", parsingError)
                }
                return [Book]()
            }
    
    func getMagazinesFromJSON() -> [Magazine] {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/ridescount.appspot.com/o/magazines.json?alt=media&token=0c7a4777-d72b-4e0f-bf82-3636845c9661"
            let url = URL(string: urlString)!
                do {
                    let data = try Data(contentsOf: url, options: .alwaysMapped)
                    let decoder = JSONDecoder()
                    let modelArray = try decoder.decode([Magazine].self, from: data)
                    return modelArray
                } catch let parsingError {
                    print("Error", parsingError)
            }
            return [Magazine]()
        }
}
    
