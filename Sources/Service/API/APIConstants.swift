//
//  APIConstants.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/08.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class APIConstants {
    static let url = "http://3.35.190.72:8080"
    
    //SignIn
    static let signInURL = url + "/auth/signin"
    
    //SignUp
    static let signUpURL = url + "/auth/signup"
    static let sendPhoneNumberURL = url + "/auth/send"
    static let checkCertificationNumberURL = url + "/auth/check"
    static let getAddress = "https://business.juso.go.kr/addrlink/addrLinkApi.do"
    
    //lost
    static let findAllPost = url + "/lost/findAll"
}
