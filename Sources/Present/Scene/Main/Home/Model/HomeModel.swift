//
//  HomeModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/19.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    var id: String?
    var title: String?
    var description: String?
    var place: String?
    var lostImages: [LostImages]?
    var category: String?
    var tags: [String]?
    var safeTransaction: Bool?
}

struct LostImages: Codable {
    var imageId: Int?
    var imageUrl: String?
}
