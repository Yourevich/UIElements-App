//
//  ActivitiIndicatorController.swift
//  LessonThree
//
//  Created by Илья Зорин on 24.08.2023.
//

import UIKit

class ActivitiIndicatorController: UIViewController {

    
    let spinner = UIActivityIndicatorView()
    let button: UIButton = {
    let button = UIButton()
    button.configuration = .tinted()
    button.configuration?.title = "Start animation 💿"
    return button
        
}()
    
    // Init variable to save the current state
    
    var isAnimating = false
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupButton()
        setupIndicator()
        
    }
    
    // Setup for indicator
    
    func setupIndicator() {
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = false
        view.addSubview(spinner)
        spinner.stopAnimating()
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    }
    
    // Setup for button
    
    func setupButton() {
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startOfIndicator), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 300)
        
        ])
    
    }

    @objc func startOfIndicator() {
        
        if spinner.isAnimating == true {
                spinner.stopAnimating()
                button.configuration?.title = "Start animation 💿"
                    } else {
                        spinner.startAnimating()
                        button.configuration?.title = "Stop animation 🛑"
                }
    }
    
}
