//
//  TextViewController.swift
//  BooksAndMagazines
//
//  Created by admin on 28/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    var textField = UITextView()
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textField)
        setupTextField()
    }

    func setupTextField() {
        
        let textForShow = text ?? "Nothing to show"
        textField.isEditable = false
        textField.isSelectable = false
        textField.text = textForShow
        textField.font = textField.font?.withSize(20)
        textField.textColor = .black
        textField.textAlignment = .natural
        textField.scrollsToTop = true
        textField.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        glueSubviewToViewEdges(setSubview: textField)
    }
    
    func glueSubviewToViewEdges(setSubview subview: UIView)
    {
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
}
