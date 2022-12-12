//
//  AuthManager.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire

final class JwtRequestInterceptor: RequestInterceptor {
    let tk = KeyChain()
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix("http://10.82.20.18:8081") == true,
              let accessToken = tk.read(key: "accessToken") else {
            completion(.success(urlRequest))
            return
        }
        var urlRequest = urlRequest
        urlRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        let url = APIConstants.reissueURL
        let headers: HTTPHeaders = ["Authorization" : tk.read(key: "refreshToken")!]
        
        AF.request(url, method: .post, encoding: JSONEncoding.default, headers: headers).responseJSON { [weak self] response in
            switch response.result{
            case .success(_):
                self?.tk.deleteAll()
                
                if let refreshToken = (try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any])? ["refreshToken"] as? String {
                    self?.tk.create(key: "refreshToken", token: refreshToken)
                }
                
                if let accessToken = (try? JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any])? ["accessToken"] as? String {
                    self?.tk.create(key: "accessToken", token: accessToken)
                }
                completion(.retry)
            case .failure(let error):
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
