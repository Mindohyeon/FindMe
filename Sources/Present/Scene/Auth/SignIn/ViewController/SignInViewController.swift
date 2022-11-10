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
        $0.image = FindMeAsset.Images.logoImg.image
        $0.contentMode = .scaleAspectFit
    }
    
    private let inputIdTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "아이디를 입력해주세요.")
    }
    
    private let inputPasswordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 입력해주세요.")
    }
    
    private lazy var signInButton = CustomButton().then {
        $0.setUpTitle(title: "로그인")
        $0.addTarget(self, action: #selector(signInButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private let signUpLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "아이디가 없으신가요? 회원가입 하러가기"
        $0.font = .systemFont(ofSize: 13)
        $0.isUserInteractionEnabled = true
    }
    
    @objc private func signInButtonDidTap(_ sender: UIButton) {
        guard let id = inputIdTextField.text else { return }
        guard let password = inputPasswordTextField.text else { return }
        
        viewModel.fetch(id: id, password: password)
        print("")
        viewModel.pushTabBarVC()
    }
    
    @objc private func signUpButtondidTap(_ sender: UITapGestureRecognizer) {
        viewModel.pushPhoneNumberCertifyVC()
    }
    
    override func configureVC() {
        let attributedStr = NSMutableAttributedString(string: signUpLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.blue, range: (signUpLabel.text! as NSString).range(of: "회원가입"))
        signUpLabel.attributedText = attributedStr
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(signUpButtondidTap(_:)))
        signUpLabel.addGestureRecognizer(tap)
    }
    
    override func addView() {
        view.addSubViews(logoImageView, inputIdTextField, inputPasswordTextField, signInButton, signUpLabel)
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(135)
            $0.leading.trailing.equalToSuperview().inset(95)
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
        
        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(76)
        }
    }
}
