//
//  showDisplayViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 27/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ShowDisplayViewController: UIViewController {

    var tableView = UITableView()
    var closeBarButton = UIBarButtonItem()
    var array = [DisplayInfoProtocol]()
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setLeftBarButton(closeBarButton, animated: true)
        configureTableView()
        configureBarButton()
    }

    private func configureTableView() {
        
        let tableViewBackground = UIImageView()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        
        tableViewBackground.image = UIImage(named: array.first?.wallPaper ?? "books")
        tableViewBackground.contentMode = .scaleAspectFill
        tableViewBackground.alpha = 0.2
        tableView.backgroundView = tableViewBackground
        
    }
    
    private func configureBarButton() {
        closeBarButton.style = .done
        closeBarButton.title = "Close"
        closeBarButton.target = self
        closeBarButton.action = #selector(dismissAction)
    }
    
    @objc private func dismissAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ShowDisplayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let detaledViewController = TextViewController()
        detaledViewController.title = "Detailed info"
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
        
        cell.backgroundColor = .clear
        
        return (cell)
    }
}
