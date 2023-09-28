//
//  StackViewController.swift
//  LessonThree
//
//  Created by Илья Зорин on 23.09.2023.
//

import UIKit

class StackViewController: UIViewController {
    
    var views: [UIView] = []
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alpha = 0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "UIStackView"
        view.backgroundColor = .systemGray6
        view.addSubview(stackView)
        configureStackView()
        
        for _ in 0...2 {
            let newView = UIView()
            configureView(someView: newView)
            views.append(newView)
            stackView.addArrangedSubview(newView)
        }
        
        
        // Uppend animations
        
        UIView.animate(withDuration: 5.0) {
            self.stackView.alpha = 1.0
            
            
        }
    }
    
    private func configureStackView() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20)
            
        ])
        
    }
    
    private func configureView(someView: UIView) {
        someView.backgroundColor = .systemGreen
        someView.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            someView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}








