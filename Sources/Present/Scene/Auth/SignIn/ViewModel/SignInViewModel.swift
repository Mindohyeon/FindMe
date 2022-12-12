//
//  LoginViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/04.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire

class SignInViewModel: BaseViewModel {
    let url = APIConstants.signInURL
//    let token = UserManager.shared
    
    func pushPhoneNumberCertifyVC() {
        coordinator.navigate(to: .phoneNumberCertityIsRequired)
    }
    
    func pushTabBarVC() {
        coordinator.navigate(to: .pushTabBarIsRequired)
    }
    
    func fetch(id: String, password: String) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let params = ["id": id, "password": password]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error")
        }
        
        AF.request(request).responseJSON { [weak self] response in
            //response.result == 토큰
            print(response.response?.statusCode)
            
            switch response.result {
            case .success(let loginData):
                print("성공")
                print("token = \(response.result)")
                let tk = KeyChain()
                
                if let refreshToken = (try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any])? ["refreshToken"] as? String {
                    print("refreshtoken = \(refreshToken)")
                    tk.create(key: "refreshToken", token: refreshToken)
                }
                
                if let accessToken = (try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any])? ["accessToken"] as? String {
                    print("accesstoken = \(accessToken)")
                    tk.create(key: "accessToken", token: accessToken)
                }
                self?.pushTabBarVC()
                
            case .failure(let error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
}
