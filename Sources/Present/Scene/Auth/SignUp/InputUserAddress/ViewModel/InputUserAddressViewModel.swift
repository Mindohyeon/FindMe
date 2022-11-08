//
//  InputAddressViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire

class InputUserAddressViewModel: BaseViewModel {
    let url = APIConstants.signUpURL
    let userInfo = SignUpModel.share
    
    func fetch() {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["id": userInfo.id, "password": userInfo.password, "phoneNumber": userInfo.phoneNumber,
                      "userName": userInfo.userName, "address": userInfo.address]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error")
        }
        
        AF.request(request).responseData { response in
            print(response.response?.statusCode)
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("error = \(error.errorDescription)")
            }
        }
    }
}
