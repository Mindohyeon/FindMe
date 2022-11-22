//
//  MainViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol findAllPresentable: AnyObject {
    var findAllData: PublishSubject<[HomeModel]> { get }
}

class HomeViewModel: BaseViewModel {
    
//    static func predeict(request: MyRequestInterceptor, completion: @escaping (_ succeed: UserManager?, _ failed: Error?) -> Void) {
//
//    }
    weak var delegate: findAllPresentable?
    
    func findAllItems() {
        let url = APIConstants.findAllPost
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json", "Authorization": UserManager.shared.accessToken!]
        print("accessToken121 = \(UserManager.shared.accessToken!)")
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: headers)
        .responseJSON { [weak self] response in
            print("status = \(String(describing: response.response?.statusCode))")
            print("string = \(String(describing: String(data: response.data!, encoding: .utf8))))")
            
            let decodeResponse = try? JSONDecoder().decode([HomeModel].self, from: response.data!)
            self?.delegate?.findAllData.onNext(decodeResponse ?? .init())
            print("delegate decoderesponse = \(decodeResponse)")
            print("decodeResponse = \(String(describing: decodeResponse))")
            
            switch response.result {
            case .success:
                print("success")
            case .failure(let error):
                print("failure = \(error)")
            }
        }
    }
}
