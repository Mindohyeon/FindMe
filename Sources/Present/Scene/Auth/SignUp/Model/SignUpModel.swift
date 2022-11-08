//
//  SignUpModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/08.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class SignUpModel: Codable {
    static let signUpModel = SignUpModel()
    
    var id: String?
    var password: String?
    var phoneNumber: String?
    var userName: String?
    var address: String?
}
