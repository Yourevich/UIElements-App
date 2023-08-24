//
//  SliderController.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import UIKit

class SliderController: UIViewController {
    
    
    let slider = UISlider(frame: CGRect(x: 40, y: 200, width: 300, height: 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSlider()
        view.addSubview(slider)
        
        
    }
    
    
    func setupSlider() {
           view.addSubview(slider)
           slider.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               slider.widthAnchor.constraint(equalToConstant: 300),
               slider.heightAnchor.constraint(equalToConstant: 100)
           ])
       }
    
   
    
    
    


}
