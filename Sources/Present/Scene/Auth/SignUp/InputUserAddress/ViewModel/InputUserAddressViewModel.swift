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
    let userInfo = SignUpModel.share
    
    func popToRootVC() {
        coordinator.navigate(to: .popToRootViewIsRequired)
    }
    
    func getAddress(address: String) {
        let params: Parameters = [
            "currentPage": 1,
            "countPerPage": 10,
            "keyword": address,
            "confmKey": "devU01TX0FVVEgyMDIyMTEwNzE4MDQ1MjExMzE5NTY="
        ]
        let url = APIConstants.getAddress
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.queryString,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .responseData { response in
            do {
                switch response.result {
                case .success(_):
                    print("this is fetch function")
                    print("jsonData = \(response)")
                    
                case .failure(let error):
                    print("error!! = \(error)")
                }
            }
        }
    }
    
    func fetch() {
        let url = APIConstants.signUpURL
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
        
        
        AF.request(request).responseData { [weak self] response in
            print(response.response?.statusCode)
            switch response.response?.statusCode {
            case 200, 201:
                print("회원가입 성공")
                self?.popToRootVC()
                break;
            case 400:
                print("- 아이디를 입력하지 않았을 경우비밀번호를 입력하지 않았을 경우 핸드폰 번호를 입력하지 않았을 경우 이름을 입력하지 않았을 경우 이름을 입력하지 않았을 경우")
                
            case 409:
                print("이미 있는 아이디")
                
            default:
                print("what")
            }
        }
    }
}
