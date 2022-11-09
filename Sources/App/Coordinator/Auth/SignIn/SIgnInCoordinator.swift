//
//  SIgnInCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/04.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class SignInCoordinator: baseCoordinator {
    
    override func start() {
        let vm = SignInViewModel(coordinator: self)
        let vc = SignInViewController(viewModel: vm)
        
        navigationController.setViewControllers([vc], animated: true)
    }
    
    override func navigate(to step: FMStep) {
        switch step {
        case .phoneNumberCertityIsRequired:
            phoneNumberCerticyIsRequired()

        default:
            return
        }
    }
}

private extension SignInCoordinator {
    private func phoneNumberCerticyIsRequired() {
        let vc = PhoneNumberCertifyCoordinator(navigationController: navigationController)
        vc.parentCoordinator = self
        childCoordinators.append(vc)
        vc.start()
    }
}
