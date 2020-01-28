//
//  DayClass.swift
//  RidesCount
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class DayItem: Decodable {
    var date: String = ""
    var metroRide: Int = 0
    var mccRide: Int = 0
    var tatRide: Int = 0
    
    let metroAndMccCost: Int = 38
    let tatCost: Int = 38
}
