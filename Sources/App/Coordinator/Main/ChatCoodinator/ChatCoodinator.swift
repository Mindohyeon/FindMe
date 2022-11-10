//
//  ChatCoodinator.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/10.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class ChatCoordinator: baseCoordinator {
    override func start() {
        let vm = ChatViewModel(coordinator: self)
        let vc = ChatViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
