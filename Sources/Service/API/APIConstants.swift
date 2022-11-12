//
//  APIConstants.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/08.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class APIConstants {
    static let url = "http://3.38.93.163:8082"
    static let signUpURL = url + "/auth/signup"
    static let signInURL = url + "/auth/signin"
    static let sendPhoneNumberURL = url + "/auth/send"
    static let checkCertificationNumberURL = url + "/auth/check"
}

