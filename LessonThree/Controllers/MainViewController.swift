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
                (.UITextField, TextFieldController()),
                (.UIDatePicker, DatePickerController()),
                (.UIStepper, StepperController())
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
                (.UIActivityIndicatorView, ActivitiIndicatorController()),
                (.UIStackView, StackViewController())
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
        .UITextField: UIImage(systemName: "character.cursor.ibeam")!,
        .UIDatePicker: UIImage(systemName: "calendar")!,
        .UIStepper: UIImage(systemName: "plus.square.fill.on.square.fill")!,
        .UIStackView: UIImage(systemName: "square.stack.3d.down.forward.fill")!
        
    ]
    
    // Create searchController
    
    private let searchController = UISearchController(searchResultsController: nil)
    var filteredData: [Section] = []
    
    //Create instance for UI
    
    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray5
        view.addSubview(tableView)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите название"
        definesPresentationContext = true
        
        tableView.rowHeight = 50
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        setupSearchController()
        filteredData = data
        
        
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
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    
}
// Extension for conforming protocols UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData[section].rows.count
    }
    
    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("Failed to dequeue CustomTableViewCell")
        }
        cell.textLabel?.textAlignment = .left
        cell.accessoryType = .disclosureIndicator
        
        let rowData = filteredData[indexPath.section].rows[indexPath.row]
        
        cell.customLabel.text = rowData.type.rawValue
        if let image = imageDictionary[rowData.type] {
            cell.configure(with: image)
        }
        
        return cell
    }
    
    // Func of conforming protocol
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowData = filteredData[indexPath.section].rows[indexPath.row]
        if let sectionIndex = data.firstIndex(where: { $0.type == filteredData[indexPath.section].type }),
           let rowIndex = data[sectionIndex].rows.firstIndex(where: { $0.type == rowData.type }) {
            let controller = data[sectionIndex].rows[rowIndex].controller
            navigationController?.pushViewController(controller, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        data[section].type.rawValue
    }
    
}

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            let lowercaseSearchText = searchText.lowercased()
            
            if !lowercaseSearchText.isEmpty {
                filteredData = data.map { section in
                    let filteredRows = section.rows.filter { $0.type.rawValue.lowercased().contains(lowercaseSearchText) }
                    return Section(type: section.type, rows: filteredRows)
                }.filter { !$0.rows.isEmpty }
            } else {
                filteredData = data
            }
        } else {
            filteredData = data
        }
        tableView.reloadData()
        
    }
    
}



