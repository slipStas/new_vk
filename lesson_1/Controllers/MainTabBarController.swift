//
//  MainTabBarController.swift
//  lesson_1
//
//  Created by Stanislav on 22.03.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }

    func setupViewControllers() {
        let friendsVC = FriendsViewController()
        let groupsVC = GroupsViewController()
        
        friendsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        groupsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        viewControllers = [friendsVC, groupsVC]
    }
}
