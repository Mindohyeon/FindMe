//
//  TabBarCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class TabBarCoordinator: baseCoordinator {
    var childCoordinator: [Coordinator] = []
    let tabBarViewController = UITabBarController()
    
    override func start() {
        let firstItem = UITabBarItem(title: nil, image: UIImage(asset: FindMeAsset.Images.mapIcon), tag: 0)
        let secondItem = UITabBarItem(title: nil, image: UIImage(asset: FindMeAsset.Images.homeIcon), tag: 1)
        let thirdItem = UITabBarItem(title: nil, image: UIImage(asset: FindMeAsset.Images.chatIcon), tag: 2)
        
        UITabBar.appearance().tintColor = .init(red: 0.39, green: 0.49, blue: 1, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .init(red: 0.74, green: 0.77, blue: 0.92, alpha: 1)
        
        let firstVC = UINavigationController()
        firstVC.tabBarItem = firstItem
        let firstCoordinator = MapCoodinator(navigationController: firstVC)
        firstCoordinator.parentCoordinator = self
        childCoordinators.append(firstCoordinator)
        
        let secondVC = UINavigationController()
        secondVC.tabBarItem = secondItem
        let secondCoordinator = HomeCoordinator(navigationController: secondVC)
        secondCoordinator.parentCoordinator = self
        childCoordinators.append(secondCoordinator)
        
        let thirdVC = UINavigationController()
        thirdVC.tabBarItem = thirdItem
        let thirdCoodinator = ChatCoordinator(navigationController: thirdVC)
        thirdCoodinator.parentCoordinator = self
        childCoordinators.append(thirdCoodinator)
        
        tabBarViewController.viewControllers = [firstVC, secondVC, thirdVC]
        tabBarViewController.modalPresentationStyle = .fullScreen
        
        start(coordinator: firstCoordinator)
        start(coordinator: secondCoordinator)
        start(coordinator: thirdCoodinator)
        
        navigationController.present(tabBarViewController, animated: true)
    }
    
}
