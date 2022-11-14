//
//  MainCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class HomeCoordinator: baseCoordinator {
    override func start() {
//        let vm = HomeViewModel(coordinator: self)
        let vc = HomeViewController()
        
        navigationController.pushViewController(vc, animated: true)
    }
}
