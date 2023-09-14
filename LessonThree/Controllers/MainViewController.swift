//
//  SeconViewContoller.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let data = [
        Section(
            
            type: .UIControl,
            rows: [
                (.Button, ButtonController()),
                (.Slider, SliderController()),
                (.Switch, SwitchController()),
                (.UISegmentedControl, SegmentedControlController()),
                (.UITextField, TextFieldController())
            ]
            
        ),
        Section(
            type: .UIScrollView,
            rows: [
                (.UITextView, TextViewController())
            ]
        ),
        Section(
            type: .UIView,
            rows: [
                (.UILabel, LabelController()),
                (.UIImageView, ImageController()),
                (.UIActivityIndicatorView, ActivitiIndicatorController())
            ]
            
        )
    ]
    
    let imageDictionary: [TypeOfUi: UIImage] = [
        .UILabel: UIImage(systemName: "note.text")!,
        .UIImageView: UIImage(systemName: "photo")!,
        .UIActivityIndicatorView: UIImage(systemName: "goforward")!,
        .UITextView: UIImage(systemName: "text.viewfinder")!,
        .Slider: UIImage(systemName: "slider.vertical.3")!,
        .UISegmentedControl: UIImage(systemName: "chart.bar")!,
        .Button: UIImage(systemName: "button.programmable")!,
        .Switch: UIImage(systemName: "switch.2")!,
        .UITextField: UIImage(systemName: "character.cursor.ibeam")!
        
    ]
    
    // Create searchController
    
    let searchController = UISearchController(searchResultsController: nil)
    
    //Create instance for UI
    
    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray5
        view.addSubview(tableView)
        
        tableView.rowHeight = 50
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        
        //Confifure search
        navigationItem.searchController = searchController
        
        //Config navig.title
        navigationItem.title = "Table"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    // Setup for tableview
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 60
        
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].rows.count
    }
    
    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell else {
            fatalError("Failed to dequeue CustomTableViewCell")
        }
        cell.textLabel?.textAlignment = .left
        cell.accessoryType = .disclosureIndicator
        
        let rowData = data[indexPath.section].rows[indexPath.row]
        cell.customLabel.text = rowData.type.rawValue
        if let image = imageDictionary[rowData.type] {
            cell.configure(with: image)
        }
        return cell
    }
    
    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = data[indexPath.section].rows[indexPath.row].controller
        navigationController?.pushViewController(controller, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        data[section].type.rawValue
    }
    
    
    
}





