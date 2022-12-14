//
//  MapCoodinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/10.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class MapCoodinator: baseCoordinator {
    override func start() {
        let vm = MapViewModel(coordinator: self)
        let vc = MapViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
