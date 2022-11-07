//
//  InputUserNameViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class InputUserNameViewModel: BaseViewModel {
    func pushInputUserAddressVC() {
        coordinator.navigate(to: .inputUserAddressIsRequired)
    }
}
