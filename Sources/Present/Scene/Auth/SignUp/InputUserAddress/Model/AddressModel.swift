//
//  AddressModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/14.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation

struct AddressModel: Codable {
    var results: Results
}

struct Results: Codable {
    var common: Common
    var juso: [Juso]
}

struct Common: Codable {
    var totalCount: String?
    var currentPage: String?
    var countPerPage: String?
    var errorCode: String?
    var errorMessage: String?
}

struct Juso: Codable {
    var roadAddr: String?
    var roadAddrPart1: String? 
    var jibunAddr: String?
    var engAddr: String?
    var zipNo: String?
    var admCd: String?
    var rnMgtSn: String?
    var bdMgtSn: String?
    var bdKdcd: String?
    var siNm: String?
    var sggNm: String?
    var emdNm: String?
    var rn: String?
    var udrtYn: String?
    var buldMnnm: String?
    var buldSlno: String?
    var mtYn: String?
    var lnbrMnnm: String?
    var lnbrSlno: String?
    var emdNo: String?
    var hstryYn: String?
}
