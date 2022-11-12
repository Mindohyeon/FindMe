//
//  PhoneNumberCertify.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class PhoneNumberCertifyController: BaseVC<PhoneNumberCertifyViewModel> {
    private let phoneImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "phone.fill")
    }
    
    private let descriptionPageLabel = UILabel().then {
        $0.text = "회원가입을 위해서 본인인증이 필요합니다."
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let inputPhoneNumberTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "전화번호를 입력해주세요.")
        $0.textColor = .black
        $0.keyboardType = .numberPad
    }
    
    private lazy var sendCertificationNumberButton = UIButton().then {
        $0.setTitle("인증번호 발송", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setTitleColor(FindMeAsset.Colors.findmeMainColor.color, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(pushCertificationNumberMessageButonDidTap(_:)), for: .touchUpInside)
    }
    
    private let inputCertificationNumber = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "인증번호를 입력해주세요.")
        $0.textColor = .black
        $0.textContentType = .oneTimeCode
        $0.keyboardType = .numberPad
    }
    
    private lazy var certificationButton = CustomButton().then {
        $0.setUpTitle(title: "다음")
        $0.addTarget(self, action: #selector(certificationBtnDidTap(_:)), for: .touchUpInside)
    }
    
    private let errorLabel = UILabel().then {
        $0.text = "인증번호를 다시 확인해주세요."
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 13)
        $0.isHidden = true
    }
    
    private func inputUserPhoneNumberData() {
        guard let phoneNumberText = inputPhoneNumberTextField.text else { return }
        let userInfo = SignUpModel.share
        userInfo.phoneNumber = phoneNumberText
    }
    
    @objc private func pushCertificationNumberMessageButonDidTap(_ sender: UIButton) {
        guard let phoneNumber = inputPhoneNumberTextField.text else { return }
        viewModel.fetch(phoneNumber: phoneNumber)
    }
    
    @objc private func certificationBtnDidTap(_ sender: UIButton) {
        guard let phoneNumber = inputPhoneNumberTextField.text else { return }
        guard let authKey = inputCertificationNumber.text else { return }
        
        if authKey.count == 4 {
            viewModel.checkCertificationNumber(phoneNumber: phoneNumber, authkey: Int(authKey) ?? 0, textField: inputCertificationNumber)
            inputUserPhoneNumberData()
        } else {
            inputCertificationNumber.shake()
        }
    }
    
    override func addView() {
        view.addSubViews(phoneImageView, descriptionPageLabel,                                 inputPhoneNumberTextField, inputCertificationNumber,
                         sendCertificationNumberButton, certificationButton, errorLabel)
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
        
        inputCertificationNumber.snp.makeConstraints {
            $0.top.equalTo(inputPhoneNumberTextField.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(inputCertificationNumber.snp.bottom).offset(20)
            $0.leading.equalTo(inputCertificationNumber.snp.leading)
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
    
    override func bindVM() {
        viewModel.errorLabelIsVisible.bind { [weak self] visible in
            DispatchQueue.main.async {
                self?.errorLabel.isHidden = visible ? false : true
            }
        }
    }
}


