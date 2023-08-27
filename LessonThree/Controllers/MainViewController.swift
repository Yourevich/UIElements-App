//
//  SeconViewContoller.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
//Create instance for UI
    
    let tableView = UITableView()
    let uiItems: [TypeOfUi] = [.Button, .Slider, .Switch, .UILabel, .UIImageView, .UIActivityIndicatorView, .UITextView, .UITextField, .UISegmentedControl]
    
    let tableLabel: UILabel = {
       let label = UILabel()
        label.text = "UI Elements"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// Update the default cell color when the view is displayed
    
//    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//
//            tableView.indexPathsForSelectedRows?.forEach { indexPath in
//                tableView.deselectRow(at: indexPath, animated: false)
//            }
//
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray5
        view.addSubview(tableView)
      
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = false
        setupTableView()
        setupLabelOfTable()
    }

    
    // Setup of Text label
    
    func setupLabelOfTable() {
        view.addSubview(tableLabel)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  30),
            tableLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    // Setup for tableview
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
////            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            tableView.heightAnchor.constraint(equalToConstant: 450)
        ])
    }

}
// Extension for conforming protocols UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiItems.count
    }
    
    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.textAlignment = .left
        cell.accessoryType = .disclosureIndicator
        cell.selectedBackgroundView?.backgroundColor = UIColor.blue
        switch uiItems[indexPath.row] {
        case .Button:
            cell.textLabel?.text = "UIButton"
        case .Slider:
            cell.textLabel?.text = "UISlider"
        case .Switch:
            cell.textLabel?.text = "UISwitch"
        case .UILabel:
            cell.textLabel?.text = "UILabel"
        case .UIActivityIndicatorView:
            cell.textLabel?.text = "UIActivityIndicatorView"
        case .UIImageView:
            cell.textLabel?.text = "UIImageView"
        case .UITextField:
            cell.textLabel?.text = "UITextField"
        case .UITextView:
            cell.textLabel?.text = "UITextView"
        case .UISegmentedControl:
            cell.textLabel?.text = "UISegmentedControl"
        }
        return cell
    }

    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch uiItems[indexPath.row] {
            
        case .Button:
            let buttonViewController = ButtonController()
            navigationController?.pushViewController(buttonViewController, animated: true)
        case .Slider:
            let slidercontroller = SliderController()
            navigationController?.pushViewController(slidercontroller, animated: true)
        case.Switch:
            let switchController = SwitchController()
            navigationController?.pushViewController(switchController, animated: true)
        case.UILabel:
            let labelController = LabelController()
            navigationController?.pushViewController(labelController, animated: true)
        case.UIImageView:
            let imageController = ImageController()
            navigationController?.pushViewController(imageController, animated: true)
        case.UIActivityIndicatorView:
            let activitiIndicatorController = ActivitiIndicatorController()
            navigationController?.pushViewController(activitiIndicatorController, animated: true)
        case.UISegmentedControl:
            let segmentController = SegmentedControlController()
            navigationController?.pushViewController(segmentController, animated: true)
        case.UITextField:
            let textFieldController = TextFieldController()
            navigationController?.pushViewController(textFieldController, animated: true)
        case.UITextView:
            let textViewcontroller = TextViewController()
            navigationController?.pushViewController(textViewcontroller, animated: true)
            }
        tableView.deselectRow(at: indexPath, animated: false)
        }
    
    // The function sets the color value of the cells when clicked
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 1, green: 0.4039, blue: 0.349, alpha: 1.0)
        cell.selectedBackgroundView = selectedView
    }
    
}
