//
//  ViewController.swift
//  LessonThree
//
//  Created by Илья Зорин on 19.08.2023.
//

import UIKit

class ButtonController: UIViewController {
    
        let button: UIButton = {
        let button = UIButton()
            button.configuration = .tinted()
            button.configuration?.title = "New colore 🌈"
        return button
    }()
    
    // Create array of colores
    
    let colorMix: [UIColor] = [
        
        UIColor.red,
        UIColor.green,
        UIColor.blue,
        UIColor.yellow,
        UIColor.orange,
    ]
    
                
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        navigationItem.largeTitleDisplayMode = .never
        title = "UIButton"
    }
    
    

    func setupUI() {
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTupAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 300)
        
        ])
    
    }

    @objc func didTupAction() {
        
      
            view.backgroundColor = colorMix.randomElement()
        
    }
    

}

