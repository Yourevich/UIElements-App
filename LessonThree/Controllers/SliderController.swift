//
//  SliderController.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//
import UIKit

class SliderController: UIViewController {
    
    //Тест для коммита
    
    let slider = UISlider(frame: CGRect(x: 40, y: 200, width: 300, height: 100))
    var centerYAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSlider()
        slider.addTarget(self, action: #selector(updPointOfSlide), for: .valueChanged)
    }
    
    func setupSlider() {
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor = slider.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor!,
            slider.widthAnchor.constraint(equalToConstant: 300),
            slider.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func updPointOfSlide() {
        let sliderValue = CGFloat(slider.value)
        let maxY = view.frame.height - slider.frame.height / 2
        let minY = slider.frame.height / 2
        let newY = minY + sliderValue * (maxY - minY)
        
        centerYAnchor?.constant = newY
    }
}


