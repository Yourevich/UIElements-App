//
//  Data.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import Foundation
import UIKit

// Enum with value of all controllers

enum TypeOfUi: String, CaseIterable {
    
    case Button
    case Slider
    case Switch
    case UILabel
    case UIActivityIndicatorView
    case UIImageView
    case UITextField
    case UITextView
    case UISegmentedControl

}

enum ClassOfUI: String, CaseIterable {
    
       case UIControl
       case UIScrollView
       case UIView
   }

struct Section {
        let type: ClassOfUI
        let rows: [(type: TypeOfUi, controller: UIViewController)]
    }


