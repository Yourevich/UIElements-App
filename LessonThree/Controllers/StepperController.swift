//
//  StepperController.swift
//  LessonThree
//
//  Created by Илья Зорин on 23.09.2023.
//

import UIKit

class StepperController: UIViewController {
    
    var score: Int = 0
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "\(score)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 50)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stepper)
        view.addSubview(label)
        view.backgroundColor = UIColor.systemGray5
        setupStepper()
        setupLabel()
    }
    
    private func setupStepper() {
        NSLayoutConstraint.activate([
            stepper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        stepper.addTarget(self, action: #selector(updateScore), for: .touchUpInside)
        
    }
    
    private func setupLabel() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: stepper.topAnchor, constant: -20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    @objc func updateScore() {
        
        if stepper.value > stepper.minimumValue {
            score += 1
        } else {
            score = max(score - 1, 0)
        }
        label.text = String(score)
        
        
    }
    
    
    
}
