//
//  SignInModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/18.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

struct SignInModel : Decodable {
    let accessToken: String
    let refreshToken: String
    let tokenType: String
    let expiresIn: Int
    let scope: [String]
//    let additionalData: [String: Any]
}
