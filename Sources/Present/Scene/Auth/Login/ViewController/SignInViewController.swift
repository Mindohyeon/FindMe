//
//  SignUpViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/04.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//
import UIKit

class SignInViewController: BaseVC<SignInViewModel> {
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = FindMeAsset.Images.logoImg.image
    }
    
    private let inputIdTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "아이디를 입력해주세요.")
    }
    
    private let inputPasswordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 입력해주세요.")
    }
    
    private let signInButton = CustomButton().then {
        $0.setUpTitle(title: "로그인")
    }
    
    override func addView() {
        view.addSubViews(logoImageView, inputIdTextField, inputPasswordTextField, signInButton)
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(135)
            $0.leading.trailing.equalToSuperview().inset(95)
            $0.width.equalTo(148)
            $0.height.equalTo(49)
        }
        
        inputIdTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        inputPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(inputIdTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(inputPasswordTextField.snp.bottom).offset(42)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}
