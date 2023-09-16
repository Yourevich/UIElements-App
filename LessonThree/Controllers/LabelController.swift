//
//  LabelVController.swift
//  LessonThree
//
//  Created by Илья Зорин on 23.08.2023.
//

import UIKit

class LabelController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        configLabel()
        navigationItem.largeTitleDisplayMode = .never
        title = "UILabel"
      
        
        // Setup for label
        
        func configLabel() {
            
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textAlignment = .center
            
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
            
            let attributedText = NSMutableAttributedString(string: "Hello ", attributes: [
                .font: UIFont(name: "HelveticaNeue-Bold", size: 50)!
            ])
            
            let greenText = NSAttributedString(string: "world", attributes: [
                .font: UIFont(name: "HelveticaNeue-Bold", size: 50)!,
                .foregroundColor: UIColor.green
            ])
            
            attributedText.append(greenText)
            label.attributedText = attributedText
        }
        
    }
}
