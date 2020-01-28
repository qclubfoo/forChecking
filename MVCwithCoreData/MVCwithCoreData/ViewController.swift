//
//  ViewController.swift
//  MVCwithCoreData
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let model = Model()
    
    @IBOutlet weak var tvOutlet: UITableView!
    
    @IBAction func addButtonTap(_ sender: Any) {
        showAddCellAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvOutlet.delegate = self
        tvOutlet.dataSource = self
    }
    
    func showEditCellAlert(forIndexPath indexPath: IndexPath) {
        let product = model.getProductItem(atIndex: indexPath.row)
        let alert = UIAlertController(title: "Edit cell", message: "Add new values", preferredStyle: .alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Current name is \(product.name)" }
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Current cost is \(product.cost)" }
        
        alert.addTextField { (textField : UITextField!) -> Void in
        textField.placeholder = "Current quantity is \(product.quantity)" }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { void -> Void in
            let nameTextField = alert.textFields?.first?.text
            let costTextField = alert.textFields?[1].text
            let quantityTextField = alert.textFields?.last?.text
            self.model.editProductItem(atIndex: indexPath.row, replaceName: nameTextField, cost: costTextField, quantity: quantityTextField)
            alert.dismiss(animated: true, completion: {
                self.tvOutlet.reloadData()
            })
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { void -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated:true, completion: nil)
    }
    
    func showAddCellAlert() {
        let alert = UIAlertController(title: "Add new cell", message: "Fill the text fields", preferredStyle: .alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Input name here" }
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Input cost here" }
        
        alert.addTextField { (textField : UITextField!) -> Void in
        textField.placeholder = "Input quantity here" }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { void -> Void in
            let nameTextField = alert.textFields?.first?.text
            let costTextField = alert.textFields?[1].text
            let quantityTextField = alert.textFields?.last?.text
            self.model.addProductItem(productWithName: nameTextField, cost: costTextField, quantity: quantityTextField)
            alert.dismiss(animated: true, completion: {
                self.tvOutlet.reloadData()
            })
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { void -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        model.deleteProductItem(atIndex: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CustomCell else { return UITableViewCell() }
        let product = model.getProductItem(atIndex: indexPath.row)
        cell.setupLabels(product.name, product.cost, Int(product.quantity))
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        showEditCellAlert(forIndexPath: indexPath)
    }
    
}



