//
//  EditItemTabelTableViewController.swift
//  RidesCount
//
//  Created by admin on 23/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol EditItemDelegate: class {
    func editValue(metroRides: Int, tatRides: Int, index: Int)
}

class EditItemTableViewController: UITableViewController {
    
    @IBOutlet weak var dateOutlet: UILabel!
    @IBOutlet weak var metroRidesOutlet: UILabel!
    @IBOutlet weak var tatRidesOutlet: UILabel!
    @IBOutlet weak var metroTextFieldOutlet: UITextField!
    @IBOutlet weak var tatTextFieldOutlet: UITextField!
    
    var date: String?
    var metro: Int?
    var tat: Int?
    var index: Int?
    weak var delegate: EditItemDelegate?
    

    @IBAction func addNewRidesButt(_ sender: Any) {
//        guard let metroTextFieldOutletText = metroTextFieldOutlet.text, let metroTextFieldOutletNum = Int(metroTextFieldOutletText) else { return }
//        guard let tatTextFieldOutletText = tatTextFieldOutlet.text, let tatTextFieldOutletNum = Int(tatTextFieldOutletText) else { return }
//        guard let indexSafe: Int = index else { return }
        
        let metroNum: Int = Int(metroTextFieldOutlet.text ?? "0") ?? 0
        let tatNum: Int = Int(tatTextFieldOutlet.text ?? "0") ?? 0
        guard let indexSafe: Int = index else { return }
        
        delegate?.editValue(metroRides: metroNum, tatRides: tatNum, index: indexSafe)
        
//        delegate?.editValue(metroRides: metroTextFieldOutletNum, tatRides: tatTextFieldOutletNum, index: indexSafe)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButt(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOutlet.text = date != nil ? date! : "error date"
        metroRidesOutlet.text = metro != nil ? "Current metro/MCC rides \" \(metro!) \"" : "error at metro rides"
        tatRidesOutlet.text = tat != nil ? "Current tat rides \" \(tat!) \"" : "error at tat rides"
        
    }
}
