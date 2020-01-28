//
//  OrdinaryTableViewCell.swift
//  RidesCount
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol OrdinaryCellDelegate: class {
    func didTapButton(in cell: OrdinaryTableViewCell)
}

class OrdinaryTableViewCell: UITableViewCell {
    
    weak var delegate: OrdinaryCellDelegate?

    @IBOutlet weak var metroCounter: UILabel!
    @IBOutlet weak var tatCounter: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBAction func editButton(_ sender: Any) {
        delegate?.didTapButton(in: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
