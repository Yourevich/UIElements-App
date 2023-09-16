//
//  MainTabBarContoller.swift
//  LessonThree
//
//  Created by Илья Зорин on 05.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.systemPink

        //Create instance for controllers
        let tableController = MainViewController()
        let tableNavigationContoller = UINavigationController(rootViewController: tableController)
        
        let collectionController = CollectionController()
        
        
        //Setup bar items
        tableNavigationContoller.tabBarItem = UITabBarItem(title: "TableView", image: UIImage(systemName: "tablecells"), tag: 1)
        collectionController.tabBarItem = UITabBarItem(title: "CollectionView", image: UIImage(systemName: "square.grid.3x3"), tag: 2)
        
    
        //Append controllers in array tabbarcontrollers
        viewControllers = [tableNavigationContoller, collectionController]
        
    }

    
}
