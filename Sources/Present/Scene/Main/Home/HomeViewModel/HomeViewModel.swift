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
    func findAllItems() {
        let url = APIConstants.findAllPost
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json", "Authorization": UserManager.shared.accessToken!]
        print("accessToken121 = \(UserManager.shared.accessToken!)")
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: headers)
        .responseDecodable(of: [HomeModel].self) { response in
            print("status = \(response.response?.statusCode)")
            switch response.result {
            case .success:
                print("success")
                print("response = \(response)")
            case .failure(let error):
                print("failure = \(error)")
            }
        }
    }
}
