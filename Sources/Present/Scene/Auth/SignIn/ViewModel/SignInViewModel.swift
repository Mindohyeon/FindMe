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
    let token = UserManager.shared
    let keychain = KeyChain.shared
    
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
        //        request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let params = ["id": id, "password": password]
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("HTTP Body Error")
        }
        
        AF.request(request).responseJSON { [weak self] response in
            //response.result == 토큰
            print(response.response?.statusCode)
            print(response.result)
            
            switch response.response?.statusCode {
            case 200:
                print("성공")
                if let refreshToken = (try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any])? ["refreshToken"] as? String {
                    print("refreshtoken = \(refreshToken)")
                    UserDefaults.standard.set(refreshToken, forKey: "UserToken")
                }
                
                if let accessToken = (try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any])? ["accessToken"] as? String {
                    print("accesstoken = \(accessToken)")
                    UserManager.shared.accessToken = accessToken
                }
                
                self?.pushTabBarVC()
            case 400:
                print("- 아이디를 입력하지 않았을 경우 비밀번호를 입력하지 않았을 경우 비밀번호가 일치하지 않은 경우 비밀번호가 5-20자리가 아닌 경우 비밀번호가 영어, 숫자 둘중 하나도 없는 경우")
            case 404:
                print("아이디가 없는 경우")
            default:
                print("what")
            }
        }
    }
}
