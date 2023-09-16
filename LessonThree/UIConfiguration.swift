//
//  UIConfiguration.swift
//  LessonThree
//
//  Created by Илья Зорин on 05.09.2023.
//

import Foundation
import UIKit

func hidesBar(_ controller: [UIViewController]) {
    controller.forEach { controller in
        controller.hidesBottomBarWhenPushed = false
    }
 }

extension UIViewController {
    func updateTitle(_ title: String) {
        self.title = title
    
    }
    
}
