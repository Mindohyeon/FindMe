//
//  PhoneNumberCerticyViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Alamofire
import UIKit

class PhoneNumberCertifyViewModel: BaseViewModel {
    
    var errorLabelIsVisible = Observable(true)
    
    func pushInputUserIdVC() {
        coordinator.navigate(to: .inputUserIdIsRequired)
    }
    
    func fetch(phoneNumber: String) {
        let url = APIConstants.sendPhoneNumberURL
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
            switch response.response?.statusCode {
            case 200:
                print("메세지 발급 성공")
                
            default:
                print("what")
            }
        }
    }
    
    func checkCertificationNumber(phoneNumber: String, authkey: Int, textField: UITextField) {
        let url = APIConstants.checkCertificationNumberURL
        print("authKey = \(authkey)")
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let params = ["phoneNumber": phoneNumber, "authKey": authkey] as [String : Any]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error")
        }
        
        AF.request(request).responseData { [weak self] response in
            switch response.response?.statusCode {
            case 200:
                print("인증번호 인증 성공")
                self?.pushInputUserIdVC()
                self?.errorLabelIsVisible.value = true
                
            default:
                self?.errorLabelIsVisible.value = false
                textField.shake()
            }
        }
    }
}
