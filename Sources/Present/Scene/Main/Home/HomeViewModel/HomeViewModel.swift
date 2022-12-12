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
    weak var delegate: findAllPresentable?
    
    func pushDetailPostVC(model: HomeModel) {
        coordinator.navigate(to: .pushDetailPostIsRequired(model: model))
    }
    
    func findAllItems() {
        let url = APIConstants.findAllPost
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: headers,
                    interceptor: JwtRequestInterceptor())
        .responseJSON { [weak self] response in
            let decodeResponse = try? JSONDecoder().decode([HomeModel].self, from: response.data!)
            self?.delegate?.findAllData.onNext(decodeResponse ?? .init())
            print(decodeResponse)
            switch response.result {
            case .success:
                print("success")
            case .failure(let error):
                print("failure = \(error)")
            }
        }
    }
}
