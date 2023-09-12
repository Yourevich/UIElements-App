//
//  SegmentedControlController.swift
//  LessonThree
//
//  Created by Илья Зорин on 24.08.2023.
//

import UIKit

class SegmentedControlController: UIViewController {
    
    let label = UILabel()
    let controller = UISegmentedControl(items: ["🏀", "🏂", "🏔"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupController()
        setupLabel()
        navigationItem.largeTitleDisplayMode = .never
        title = "UISegmentedControl"
    }
    
    
    // Setup of SegmentedControl
    
    func setupController() {
        controller.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller)
        controller.selectedSegmentIndex = 0
       
        NSLayoutConstraint.activate([
            controller.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
        controller.addTarget(self, action: #selector(switchText), for: .valueChanged)
    }
    
    func setupLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🏀"
        label.font = UIFont(name: "Futura", size: 140)
      
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: controller.topAnchor, constant: -20)
        ])
    }
    
    
    
    // Function setting action for segmented controll
    
    @objc func switchText() {
        switch controller.selectedSegmentIndex {
        case 0:
            label.text = "🏀"
        case 1:
            label.text = "🏂"
        case 2:
            label.text = "🏔"
        default:
            label.text = "🏀"
        }
    
    }
    
    
}
