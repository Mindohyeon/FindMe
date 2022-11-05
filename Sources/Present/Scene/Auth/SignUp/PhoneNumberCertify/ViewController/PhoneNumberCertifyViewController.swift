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
    
    private let descriptionPageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.text = "회원가입을 위해서 본인인증이 필요합니다."
    }
    
    override func addView() {
        view.addSubViews(phoneImageView, descriptionPageLabel)
    }
    
    override func setLayout() {
        phoneImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(112)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(64)
        }
        
        descriptionPageLabel.snp.makeConstraints {
            $0.top.equalTo(phoneImageView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().offset(66)
            
        }
    }
}

