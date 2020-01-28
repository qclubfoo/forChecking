//
//  RidesArrayClass.swift
//  RidesCount
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class RidesArray {
    var ridesArray: [DayItem] = []
    
    func addNewDay() {
        let newDay = DayItem()
        ridesArray.append(newDay)
    }
}
