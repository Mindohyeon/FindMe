//
//  MapViewModel.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/10.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol findAllItemsPresentable: AnyObject {
    var findAllItemsData: PublishSubject<[MapModel]> { get }
}

class MapViewModel: BaseViewModel {
    weak var delegate: findAllItemsPresentable?
    
    func findAllItems() {
        let url = APIConstants.findAllPost
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: headers)
        .responseData { [weak self] response in
            let decodeResponse = try? JSONDecoder().decode([MapModel].self, from: response.data ?? .empty)
            self?.delegate?.findAllItemsData.onNext(decodeResponse ?? .init())
            
            switch response.result {
            case .success:
                print("success")
            case .failure(let error):
                print("failure = \(error)")
            }
        }
    }
}
