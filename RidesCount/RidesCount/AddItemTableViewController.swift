//
//  AddItemTableViewController.swift
//  RidesCount
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol AddDayDelegate: class {
    func addNewValue(date: String, metro: Int, tat: Int)
}

class AddItemTableViewController: UITableViewController {



    @IBOutlet weak var metroField: UITextField!
    @IBOutlet weak var tatField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addNewDayButton: UIButton!
    
    weak var delegate: AddDayDelegate?
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addNewDay(_ sender: Any) {
        guard let metroFieldText = metroField.text,
        let metroFieldNum = Int(metroFieldText) else {
                        return
    }
    //    @IBAction func addNewDay(_ sender: Any) {
//
//        guard let metroFieldText = metroField.text,
//              let metroFieldNum = Int(metroFieldText) else {
//                return
//        }

        guard let tatFieldText = tatField.text,
            let tatFieldNum = Int(tatFieldText) else {
                return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateText = dateFormatter.string(from: datePicker.date)
        delegate?.addNewValue(date: dateText, metro: metroFieldNum, tat: tatFieldNum)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.black.cgColor
        addNewDayButton.layer.cornerRadius = 10
        addNewDayButton.layer.borderWidth = 1
        addNewDayButton.layer.borderColor = UIColor.black.cgColor

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        metroField.becomeFirstResponder()
        // не нужно нажимать на Text field. Он автоматически выбирается перед появлением экрана и экран появляется сразу с клавиатурой и возможностью вводить данные в текстовое поле
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
        // не дает пользователю выделить/нажать на ячейку, только на текстовое поле (Text field) внутри этой ячейки
    }

}
