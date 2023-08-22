//
//  SeconViewContoller.swift
//  LessonThree
//
//  Created by Илья Зорин on 22.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    let uiItems: [TypeOfUi] = [.Button, .Slider, .Switch]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        title = "SecondViewcontroller"
        view.addSubview(tableView)
      
        tableView.rowHeight = 100
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch uiItems[indexPath.row] {
        case .Button:
            cell.textLabel?.text = "Button"
        case .Slider:
            cell.textLabel?.text = "Slider"
        case .Switch:
            cell.textLabel?.text = "Switch"
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 { // Проверяем, что нажатая ячейка - первая ячейка
                let newViewController = ViewController()
                newViewController.title = "NewViewController"
                navigationController?.pushViewController(newViewController, animated: true)
            }
        }

    
}
