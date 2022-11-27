//
//  DetailPostCoordinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/27.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class DetailPostCoordinator: baseCoordinator {
    func startDetailPostVC(model: HomeModel) {
        let vm = DetailPostViewModel(coordinator: self)
        let vc = DetailPostViewController(viewModel: vm, model: model)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
