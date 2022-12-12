//
//  UserManager.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/16.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

class UserManager: Codable {
//    static let shared = UserManager()
    
    var id: String
    var accessToken: String?
    var refreshToken: String?
    var expiredAt: String?  
    
//    private init() {}
}
