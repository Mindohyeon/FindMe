//
//  InputUserNameCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class InputUserNameCoordinator: baseCoordinator {
    override func start() {
        let vm = InputUserNameViewModel(coordinator: self)
        let vc = InputUserNameViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
