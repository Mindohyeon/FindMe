//
//  HomeModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/19.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    var id: Int
    var title: String
    var description: String
    var imageUrl: [String]
    var category: String
    var tags: [String]
    var isSafe: Bool
    var place: String
    var latitude: String
    var longitude: String
}
