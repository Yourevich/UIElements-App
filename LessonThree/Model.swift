//
//  Data.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import Foundation

// Enum with value of all controllers

enum TypeOfUi: CaseIterable {
    
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

enum ClassOfUI: CaseIterable {
    
       case UIControl
       case UIScrollView
       case UIView
   }
