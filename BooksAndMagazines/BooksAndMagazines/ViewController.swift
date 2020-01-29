//
//  ViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 24/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bookButton = UIButton(type: .roundedRect)
    var magazineButton = UIButton(type: .roundedRect)
    var backroundImage = UIImageView()
    let booksModel = BooksModel()
    let magazinesModel = MagazinesModel()
    var books = [Book]()
    var magazines = [Magazine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let buttons: [UIButton] = [bookButton, magazineButton]
        books = booksModel.getBooks()
        magazines = magazinesModel.getMagazines()
        view.addSubview(backroundImage)
        backroundImage.translatesAutoresizingMaskIntoConstraints = false
        backroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backroundImage.image = UIImage(named: "books")
        backroundImage.alpha = 0.60
        backroundImage.contentMode = .scaleAspectFill
        for button in buttons {
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        }
        setupButton(button: bookButton, withTitle: "Books", withColor: .systemBlue)
        setupButton(button: magazineButton, withTitle: "Magazines", withColor: .systemRed)
        
        bookButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
        magazineButton.addTarget(self, action: #selector(magazineButtonTapped), for: .touchUpInside)
        
        bookButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        magazineButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
    
    @objc private func bookButtonTapped() {
        displayNavController(forArray: books)
    }
    
    @objc private func magazineButtonTapped() {
        displayNavController(forArray: magazines)
    }
    
    private func displayNavController(forArray array: [DisplayInfoProtocol]) {
        let loadVC = ShowDisplayViewController()
        loadVC.title = array.first?.navControllerLable
        let navigationController = UINavigationController(rootViewController: loadVC)
        navigationController.modalPresentationStyle = .fullScreen
        loadVC.array = array
        present(navigationController, animated: true, completion: nil)
    }
    
    private func setupButton(button: UIButton, withTitle title: String, withColor newColor: UIColor?) {
        let color: UIColor
        color = newColor ?? UIColor.gray
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Pushed", for: .highlighted)
        button.setTitleColor(.white, for: .highlighted)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
