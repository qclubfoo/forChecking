//
//  showDisplayViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class showDisplayViewController: UIViewController {

    var tableView = UITableView()
    var array = [DisplayInfoProtocol]()
    
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

}

extension showDisplayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.rowHeight = 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row != totalRows - 1 {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitled")
            cell.textLabel?.text = array[indexPath.row].labelOne
            cell.detailTextLabel?.text = array[indexPath.row].labelTwo
            return (cell)
        } else {
            let cell = UITableViewCell()
            let dismissButton = UIButton(type: .roundedRect)
            dismissButton.layer.cornerRadius = 5
            cell.addSubview(dismissButton)
            dismissButton.backgroundColor = .red
            dismissButton.setTitle("Dismiss", for: .normal)
            dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
            dismissButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: dismissButton, attribute: .centerX, relatedBy: .equal, toItem: cell, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: dismissButton, attribute: .centerY, relatedBy: .equal, toItem: cell, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: dismissButton, attribute: .width, relatedBy: .equal, toItem: cell, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
            NSLayoutConstraint(item: dismissButton, attribute: .height, relatedBy: .equal, toItem: cell, attribute: .height, multiplier: 0.75, constant: 0).isActive = true
            return cell
        }
    }
    
    @objc func dismissAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
