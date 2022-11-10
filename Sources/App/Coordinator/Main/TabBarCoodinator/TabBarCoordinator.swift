//
//  TabBarCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class TabBarCoordinator: baseCoordinator {
    override func start() {
        let tabBarViewController = UITabBarController()
        
        let firstItem = UITabBarItem(title: nil, image: UIImage(systemName: ""), tag: 0)
        let secondItem = UITabBarItem(title: nil, image: UIImage(systemName: ""), tag: 1)
        let thirdItem = UITabBarItem(title: nil, image: UIImage(systemName: ""), tag: 2)
        
        UITabBar.appearance().tintColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .init(red: 0.74, green: 0.77, blue: 0.92, alpha: 1)
        
        let firstVC = UINavigationController()
        firstVC.tabBarItem = firstItem
        let firstCoordinator = MapCoodinator(navigationController: firstVC)
        firstCoordinator.parentCoordinator = self
        
        let secondVC = UINavigationController()
        secondVC.tabBarItem = secondItem
        let secondCoordinator = HomeCoordinator(navigationController: secondVC)
        secondCoordinator.parentCoordinator = self
        
        let thirdVC = UINavigationController()
        thirdVC.tabBarItem = thirdItem
        let thirdCoodinator = ChatCoordinator(navigationController: thirdVC)
        thirdCoodinator.parentCoordinator = self
        
        tabBarViewController.viewControllers = [firstVC, secondVC, thirdVC]
//        tabBarViewController.setViewControllers([tabBarViewController], animated: true)
        navigationController.present(tabBarViewController, animated: true)
        
        start(coordinator: firstCoordinator)
        start(coordinator: secondCoordinator)
        start(coordinator: thirdCoodinator)
    }
    
}