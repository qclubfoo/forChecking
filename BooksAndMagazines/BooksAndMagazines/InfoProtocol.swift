//
//  InfoProtocol.swift
//  BooksAndMagazines
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

protocol DisplayInfoProtocol {
    var nameLabel: String { get }
    var detailLable: String { get }
    var about: String? { get }
}
