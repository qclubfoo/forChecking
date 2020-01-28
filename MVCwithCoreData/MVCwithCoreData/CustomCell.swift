//
//  CustomCell.swift
//  MVCwithCoreData
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var costOutlet: UILabel!
    @IBOutlet weak var quantityOutlet: UILabel!
    
    func setupLabels(_ name: String, _ cost: Double, _ quantity: Int) {
        nameOutlet.text = name
        costOutlet.text = String(cost)
        quantityOutlet.text = String(quantity)
    }

}
