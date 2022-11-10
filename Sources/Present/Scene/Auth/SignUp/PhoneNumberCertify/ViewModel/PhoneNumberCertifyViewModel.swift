//
//  PhoneNumberCerticyViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire

class PhoneNumberCertifyViewModel: BaseViewModel {
    let url = APIConstants.sendPhoneNumberURL
    
    func pushInputUserIdVC() {
        coordinator.navigate(to: .inputUserIdIsRequired)
    }
    
    func fetch(phoneNumber: String) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = ["phoneNumber": phoneNumber]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error")
        }
        
        AF.request(request).responseData { [weak self] response in
            print(response.response?.statusCode)
            switch response.response?.statusCode {
            case 200:
                print("메세지 발급 성공")
                
            case 400:
                print("핸드폰 번호가 입력되지 않은 경우")
                
            case 500:
                print("발송 실패")
                
            default:
                print("what")
            }
        }
        
    }
}
