//
//  TabBar.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        viewControllers = [
            createMainController(),
            createEmptyController(title: "Profile"),
            createEmptyController(title: "Contacts"),
            createEmptyController(title: "Bin")
        ]
    }
    
    private func createMainController() -> UIViewController {
        let view = MainAssembler.createModule()
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.tabBarItem.title = "Catalog"
        navigationController.tabBarItem.image = UIImage(systemName: "cart")
        return navigationController
    }
    
    private func createEmptyController(title: String) -> UIViewController {
        let view = EmptyController()
        view.tabBarItem.title = title
        if title == "Profile" {
            view.tabBarItem.image = UIImage(systemName: "person")
        } else if title == "Contacts" {
            view.tabBarItem.image = UIImage(systemName: "phone")
        } else {
            view.tabBarItem.image = UIImage(systemName: "bag")
        }
        return view
    }
}
