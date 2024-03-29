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
        guard urlRequest.url?.absoluteString.hasPrefix(APIConstants.baseURL) == true,
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
        let headers: HTTPHeaders = ["RefreshToken" : tk.read(key: "refreshToken") ?? .init()]
        
        AF.request(url, method: .patch, encoding: JSONEncoding.default, headers: headers).responseData { [weak self] response in
            print("retry status code = \(response.response?.statusCode)")
            switch response.result {
            case .success(let data):
                self?.tk.deleteAll()
                let decodeResult = try? JSONDecoder().decode(UserManager.self, from: data)
                self?.tk.create(key: "accessToken", token: decodeResult?.accessToken ?? "")
                self?.tk.create(key: "refreshToken", token: decodeResult?.refreshToken ?? "")
                completion(.retry)
            case .failure(let error):
                completion(.doNotRetryWithError(error))
            }
        }
    }
}

