//
//  DatePickerController.swift
//  LessonThree
//
//  Created by Илья Зорин on 23.09.2023.
//

import UIKit

class DatePickerController: UIViewController {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите дату рождения"
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.locale = Locale(identifier: "ru_RU")
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "UIDatePicker"
        view.backgroundColor = UIColor.systemGray5
        view.addSubview(textField)
        setupField()
        setupToolBar()
    }
    
    private func setupField() {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        textField.inputView = datePicker
        
    }
    
    private func setupToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: false)
        textField.inputAccessoryView = toolbar
    }
    
    
    @objc private func doneAction() {
        getDatePicker()
        textField.resignFirstResponder()
        
    }
    
    private func getDatePicker() {
        let formater = DateFormatter()
        formater.dateFormat = "MM.dd.yyyy"
        textField.text = formater.string(from: datePicker.date)
        
        
    }
}
