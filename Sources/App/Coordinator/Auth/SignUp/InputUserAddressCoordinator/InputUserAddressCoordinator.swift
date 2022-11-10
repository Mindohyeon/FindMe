//
//  InputUserAddressCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class InputUserAddressCoordinator: baseCoordinator {
    override func start() {
        let vm = InputUserAddressViewModel(coordinator: self)
        let vc = InputUserAddressViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: FMStep) {
        switch step {
        case .popToRootViewIsRequired:
            popToRootViewIsRequired()
            
        default:
            return
        }
    }
}

private extension InputUserAddressCoordinator {
    private func popToRootViewIsRequired() {
        print("pop")
        self.navigationController.popToRootViewController(animated: true)
    }
}
