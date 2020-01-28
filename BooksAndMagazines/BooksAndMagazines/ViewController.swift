//
//  ViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 24/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonOne = UIButton(type: .roundedRect)
    var buttonTwo = UIButton(type: .roundedRect)
    var books: [Book] = [Book(name: "War and Peace", author: "L.N.Tolstoy"), Book(name: "Evgeniy Onegin", author: "A.S. Pushkin")]
    var magazines: [Magazine] = [Magazine(name: "Ideas of your home", dateOfProduce: 1990), Magazine(name: "Tog gear", dateOfProduce: 2010), Magazine(name: "DIY Garden", dateOfProduce: 2020)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons: [UIButton] = [buttonOne, buttonTwo]
        view.backgroundColor = .white
        for button in buttons {
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        }
        setupButton(button: buttonOne, withTitle: "Books", withColor: .systemBlue)
        setupButton(button: buttonTwo, withTitle: "Magazines", withColor: .systemTeal)
        
        buttonOne.addTarget(self, action: #selector(bookButtonTapped(sender:)), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(magazineButtonTapped(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint(item: buttonOne, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -100).isActive = true
        NSLayoutConstraint(item: buttonTwo, attribute: .top, relatedBy: .equal, toItem: buttonOne, attribute: .bottom, multiplier: 1, constant: 100).isActive = true
    }
    
    
    @objc private func bookButtonTapped(sender: UIButton) {
        let loadVC = showDisplayViewController()
        loadVC.array = books
        self.present(loadVC, animated: true)
        print("bookButtonTapped")
    }
    
    @objc private func magazineButtonTapped(sender: UIButton) {
        let loadVC = showDisplayViewController()
        loadVC.array = magazines
        self.present(loadVC, animated: true)
        print("magazineButtonTapped")
    }
    
    private func setupButton(button: UIButton, withTitle title: String, withColor newColor: UIColor?) {
        let color: UIColor
        color = newColor ?? UIColor.gray
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Pushed", for: .highlighted)
        button.setTitleColor(.red, for: .highlighted)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}

