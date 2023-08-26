//
//  ImageController.swift
//  LessonThree
//
//  Created by Илья Зорин on 24.08.2023.
//

import UIKit

class ImageController: UIViewController {
    
    var imageView = UIImageView()
    let image = UIImage(named: "jordan")

    override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    setupImaveView()
    
        
    func setupImaveView() {

        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.image = image
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 600)
        ])}
    }
    
    }
    
    

    


