//
//  TextViewController.swift
//  LessonThree
//
//  Created by Илья Зорин on 24.08.2023.
//

import UIKit

class TextViewController: UIViewController {
    
    let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupTextView()
        navigationItem.largeTitleDisplayMode = .never
        title = "UITextView"
       
    }
    
    // Setup of TextView
    
    func setupTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.systemGray5
        textView.font = UIFont(name: "Futura", size: 100)
        textView.text = "this text cannot be deleted or copied 👺"
        textView.isEditable = false
        textView.isSelectable = false
        textView.contentInset = .zero
       
        
        view.addSubview(textView)
    
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
        
    }
}
