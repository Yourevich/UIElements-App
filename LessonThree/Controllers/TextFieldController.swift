//
//  TextFieldController.swift
//  LessonThree
//
//  Created by Илья Зорин on 24.08.2023.
//

import UIKit

class TextFieldController: UIViewController {
    
    let textFieldOfNumber = UITextField()
    let textFieldOfPassword = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
        setupTextField()
        
    }
    
    // Setup of TextField
    
    func setupTextField() {
        textFieldOfNumber.translatesAutoresizingMaskIntoConstraints = false
        textFieldOfNumber.placeholder = "Введите номер"
        textFieldOfNumber.borderStyle = .roundedRect
        textFieldOfNumber.keyboardType = .phonePad
        view.addSubview(textFieldOfNumber)
    
        NSLayoutConstraint.activate([
            textFieldOfNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldOfNumber.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textFieldOfNumber.widthAnchor.constraint(equalToConstant: 150)

        ])
        
        textFieldOfPassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldOfPassword.placeholder = "Введите пароль"
        textFieldOfPassword.isSecureTextEntry = true
        textFieldOfPassword.borderStyle = .roundedRect
        textFieldOfPassword.keyboardType = .default
        view.addSubview(textFieldOfPassword)
    
        NSLayoutConstraint.activate([
            textFieldOfPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldOfPassword.widthAnchor.constraint(equalToConstant: 150),
            textFieldOfPassword.topAnchor.constraint(equalTo: textFieldOfNumber.bottomAnchor,constant: 20)

        ])
    
    }

}
