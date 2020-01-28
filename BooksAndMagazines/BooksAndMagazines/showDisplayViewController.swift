//
//  showDisplayViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShowDisplayViewController: UIViewController {

    var navController = UINavigationController()
    var tableView = UITableView()
    var closeBarButton = UIBarButtonItem()
    var backButton = UIBarButtonItem()
    var array = [DisplayInfoProtocol]()
    
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(closeBarButton, animated: true)
        configureTableView()
//        configureBarButton()
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
    }
    
//    func configureBarButton() {
//        closeBarButton.style = .done
//        closeBarButton.title = "Close"
//        closeBarButton.target = self
//        closeBarButton.action = #selector(dismissAction)
//    }
    
//    @objc func dismissAction() {
//        self.dismiss(animated: true, completion: nil)
//    }
    
}

extension ShowDisplayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let detaledViewController = TextViewController()
        detaledViewController.text = array[indexPath.row].about
        navigationController?.pushViewController(detaledViewController, animated: true)
    }
}

extension ShowDisplayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitled")
        cell.textLabel?.text = array[indexPath.row].nameLabel
        cell.detailTextLabel?.text = array[indexPath.row].detailLable
        cell.accessoryType = .detailButton
        cell.selectionStyle = .none
        return (cell)
    }
}
