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
                   interceptor: JwtRequestInterceptor()).validate()
            .responseData(emptyResponseCodes: [200, 201, 204]) { [weak self] response in
            switch response.result {
            case .success(let data):
                let decodeResponse = try? JSONDecoder().decode([HomeModel].self, from: data)
                self?.delegate?.findAllData.onNext(decodeResponse ?? .init())
                print("success")
            case .failure(let error):
                print("HomeViewModelfailure = \(error.localizedDescription)")
            }
        }
    }
}
