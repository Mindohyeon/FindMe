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
        let vm = HomeViewModel(coordinator: self)
        let vc = HomeViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: FMStep) {
        switch step {
        case .pushDetailPostIsRequired(let model):
            pushDetailPostIsRequired(model: model)
            
        default:
            return
        }
    }
}

extension HomeCoordinator {
    func pushDetailPostIsRequired(model: HomeModel) {
        let vc = DetailPostCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.startDetailPostVC(model: model)
    }
}
