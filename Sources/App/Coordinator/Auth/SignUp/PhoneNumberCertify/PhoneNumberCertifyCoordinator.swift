//
//  PhoneNumberCertifyCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class PhoneNumberCertifyCoordinator: baseCoordinator {
    
    override func start() {
        let vm = PhoneNumberCertifyViewModel(coordinator: self)
        let vc = PhoneNumberCertifyController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: FMStep) {
        switch step {
        case .inputUserIdIsRequired:
            userInputIdIsRequired()
            
        default:
            return
        }
    }
}

private extension PhoneNumberCertifyCoordinator {
    private func userInputIdIsRequired() {
        let vc = InputUserIdCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.start()
    }
}
