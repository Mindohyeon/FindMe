//
//  InputUserIdViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/06.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class InputUserIdViewController: BaseVC<InputUserIdViewModel> {
    private let descriptionPageLabel = UILabel().then {
        $0.text = "사용하실 아이디와 비밀번호를 입력해주세요."
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let inputIdTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "아이디를 입력해주세요.")
    }
    
    private let inputPasswordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 입력해주세요.")
    }
    
    private let inputCheckPasswordTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "비밀번호를 다시 입력해주세요.")
    }
    
    private lazy var nextButton = CustomButton().then {
        $0.setUpTitle(title: "다음")
        $0.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private func insertUserIdData() {
        guard let id = inputIdTextField.text else { return }
        guard let password = inputPasswordTextField.text else { return }
        let userInfo = SignUpModel.share
        userInfo.id = id
        userInfo.password = password
    }
    
    @objc private func nextButtonDidTap(_ sender: UIButton) {
        insertUserIdData()
        viewModel.pushInputUserNameVC()
    }
    
    override func addView() {
        view.addSubViews(descriptionPageLabel, inputIdTextField, inputPasswordTextField, inputCheckPasswordTextField, nextButton)
    }
    
    override func setLayout() {
        descriptionPageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(190)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        inputIdTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionPageLabel.snp.bottom).offset(97)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        inputPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(inputIdTextField.snp.bottom).offset(52)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        inputCheckPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(inputPasswordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}
