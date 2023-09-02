//
//  SeconViewContoller.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
//Create instance for UI
    
    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray5
        view.addSubview(tableView)
      
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = true
        setupTableView()
        
        title = "Table of UI elements"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    // Setup for tableview
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
// Extension for conforming protocols UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ClassOfUI.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        switch ClassOfUI.allCases[section] {
        case .UIView:
            return 3
        case .UIControl:
            return 5
        case .UIScrollView:
            return 1
        }

    }
    
    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.textAlignment = .left
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.section {
           case 0:
               // Секция UIControl
               switch indexPath.row {
               case 0:
                   cell.textLabel?.text = "UIButton"
               case 1:
                   cell.textLabel?.text = "UISlider"
               case 2:
                   cell.textLabel?.text = "UISwitch"
               case 3:
                   cell.textLabel?.text = "UITextField"
               case 4:
                   cell.textLabel?.text = "UISegmentedControl"
               default:
                   break
               }
           case 1:
               // Секция UIScrollView
               if indexPath.row == 0 {
                   cell.textLabel?.text = "UITextView"
               }
           case 2:
               // Секция UIView
               switch indexPath.row {
               case 0:
                   cell.textLabel?.text = "UILabel"
               case 1:
                   cell.textLabel?.text = "UIImageView"
               case 2:
                   cell.textLabel?.text = "UIActivityIndicatorView"
               default:
                   break
               }
           default:
               break
           }

           return cell
    }

    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
           case 0:
               // Секция UIControl
            
               switch indexPath.row {
               case 0:
                   let buttonViewController = ButtonController()
                   navigationController?.pushViewController(buttonViewController, animated: true)
               case 1:
                   let slidercontroller = SliderController()
                   navigationController?.pushViewController(slidercontroller, animated: true)
               case 2:
                   let switchController = SwitchController()
                   navigationController?.pushViewController(switchController, animated: true)
               case 3:
                   let textFieldController = TextFieldController()
                   navigationController?.pushViewController(textFieldController, animated: true)
               case 4:
                   let segmentedController = SegmentedControlController()
                   navigationController?.pushViewController(segmentedController, animated: true)
               default:
                   break
               }
           case 1:
            
               // Секция UIScrollView
               if indexPath.row == 0 {
                   let textViewcontroller = TextViewController()
                   navigationController?.pushViewController(textViewcontroller, animated: true)
               }
           case 2:
            
               // Секция UIView
               switch indexPath.row {
               case 0:
                   let labelController = LabelController()
                   navigationController?.pushViewController(labelController, animated: true)
               case 1:
                   let imageController = ImageController()
                   navigationController?.pushViewController(imageController, animated: true)
               case 2:
                   let activityIndicatorController = ActivitiIndicatorController()
                   navigationController?.pushViewController(activityIndicatorController, animated: true)
               default:
                   break
               }
            
            
           default:
               break
           }
        
        
            tableView.deselectRow(at: indexPath, animated: false)
        }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        switch section {

        case 0:
            return "UIControl"
        case 1:
            return "UIScrollView"
        case 2:
            return "UIView"
        default:
            return nil
        }

    }

    

}

