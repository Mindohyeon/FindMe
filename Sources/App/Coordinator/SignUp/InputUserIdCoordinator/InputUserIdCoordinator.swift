//
//  InputUserIdCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class InputUserIdCoordinator: baseCoordinator {
    override func start() {
        let vm = InputUserIdViewModel(coordinator: self)
        let vc = InputUserIdViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: FMStep) {
        switch step {
        case .inputUserNameIsRequired:
            inputUserNameIsRequired()
            
        default:
            return
        }
    }
}
private extension InputUserIdCoordinator {
    private func inputUserNameIsRequired() {
        let vc = InputUserNameCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        
        vc.start()
    }
}
