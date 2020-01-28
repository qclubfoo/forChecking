//
//  TextViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 28/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

//    var label = UILabel()
    var textField = UITextView()
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        view.addSubview(label)
        view.addSubview(textField)
        setupTextField()
//        setupLabel()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setupTextField() {
        let textForShow = text ?? "Nothing to show"
        textField.isEditable = false
        textField.isSelectable = false
        textField.text = textForShow
        textField.font = textField.font?.withSize(20)
        textField.textColor = .black
        textField.textAlignment = .natural
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        NSLayoutConstraint(item: textField, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: textField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: textField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true

        
    }
//    func setupLabel() {
//        let textForShow = text ?? "Nothing to show"
//        label.font = label.font.withSize(20)
//        label.lineBreakMode = .byWordWrapping
//        label.text = textForShow
//        label.textColor = .black
//        label.textAlignment = .natural
//        label.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
//    }
}
