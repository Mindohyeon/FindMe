//
//  MainViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire

class HomeViewModel: BaseViewModel {
    func fetch() {
        print("fetch")
        let url = APIConstants.findAllPost
        
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: headers)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: HomeModel.self) { response in
            switch response.result {
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
        }
    }
}
