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
        button.backgroundColor = .systemBlue
        button.setTitle("Открыть контроллер", for: .normal)
        button.layer.cornerRadius = 7
        return button
            
    }()
                        
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        self.view.backgroundColor = .orange
        setupUI()
        title = "ViewController"
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
        
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

