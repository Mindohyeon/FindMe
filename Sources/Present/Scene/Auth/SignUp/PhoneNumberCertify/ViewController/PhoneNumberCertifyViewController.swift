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
        $0.text = "회원가입을 위해서 본인인증이 필요합니다."
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let inputPhoneNumberTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "전화번호를 입력해주세요.")
    }
    
    private let sendCertificationNumberButton = UIButton().then {
        $0.setTitle("인증번호 발송", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setTitleColor(FindMeAsset.Colors.findmeMainColor.color, for: .normal)
        $0.backgroundColor = .clear
    }
    
    private lazy var certificationButton = CustomButton().then {
        $0.setUpTitle(title: "인증")
        $0.addTarget(self, action: #selector(certificationBtnDidTap(_:)), for: .touchUpInside)
    }
    
    @objc func certificationBtnDidTap(_ sender: UIButton) {
        viewModel.pushInputUserIdVC()
    }
    
    override func addView() {
        view.addSubViews(phoneImageView, descriptionPageLabel, inputPhoneNumberTextField, sendCertificationNumberButton, certificationButton)
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
        
        inputPhoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionPageLabel.snp.bottom).offset(67)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        sendCertificationNumberButton.snp.makeConstraints {
            $0.top.equalTo(inputPhoneNumberTextField.snp.top).offset(-3)
            $0.trailing.equalTo(inputPhoneNumberTextField.snp.trailing)
        }
        
        certificationButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}

