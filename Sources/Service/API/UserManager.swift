//
//  UserManager.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

final class UserManager {
    static let share = UserManager()
    var accessToken: String?
    var refreshToken: String?
    
    private init() { }
}
