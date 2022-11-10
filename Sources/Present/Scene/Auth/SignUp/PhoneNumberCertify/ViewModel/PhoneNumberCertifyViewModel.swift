//
//  PhoneNumberCerticyViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class PhoneNumberCertifyViewModel: BaseViewModel {
    func pushInputUserIdVC() {
        coordinator.navigate(to: .inputUserIdIsRequired)
    }
}
