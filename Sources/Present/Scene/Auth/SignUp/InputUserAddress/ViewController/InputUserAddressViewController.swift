//
//  InputAddressViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class InputUserAddressViewController: BaseVC<BaseViewModel> {
    private let descriptionPageLabel = UILabel().then {
        $0.text = "분실물 배송을 위해 주소를 입력해주세요."
        $0.font = .systemFont(ofSize: 16)
    }
    
    
}
