//
//  PhoneNumberCertify.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class PhoneNumberCertifyController: BaseVC<PhoneNumberCerticyViewModel> {
    private let phoneImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "phone.fill")
    }
    
    override func addView() {
        view.addSubViews(phoneImageView)
    }
    
    override func setLayout() {
        phoneImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(112)
            $0.leading.trailing.equalToSuperview().inset(148)
            $0.size.equalTo(64)
        }
    }
}
