//
//  SwitchController.swift
//  LessonThree
//
//  Created by Илья Зорин on 23.08.2023.
//

import UIKit

class SwitchController: UIViewController {
    
  let UiSwitch = UISwitch(frame: CGRect(x: 20, y: 40, width: 30, height: 100))
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSwitch()
        navigationItem.largeTitleDisplayMode = .never
        title = "UISwitch"
       
    }
    
    // Setup for Switch
    
    func setupSwitch() {
        view.addSubview(UiSwitch)
        UiSwitch.isOn = false
        UiSwitch.addTarget(self, action: #selector(tupOnSwitch), for: .touchUpInside)
        UiSwitch.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                UiSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                UiSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    
    }
    
    @objc func tupOnSwitch() {
        
        if UiSwitch.isOn == false {
            view.backgroundColor = .white
            
        } else {
            
            view.backgroundColor = .black
        }
    
    }
}
