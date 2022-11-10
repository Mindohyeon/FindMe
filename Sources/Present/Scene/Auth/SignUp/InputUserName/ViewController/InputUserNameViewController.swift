//
//  InputUserNameViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class InputUserNameViewController: BaseVC<InputUserNameViewModel> {
    private let descriptionPageLabel = UILabel().then {
        $0.text = "분실물 배송 및 보안을 위해서\n 이름(실명)을 입력해주세요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 0
    }
    
    private let inputUserNameTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "이름(실명)을 입력해주세요.")
        $0.textColor = .black
    }
    
    private lazy var nextbutton = CustomButton().then {
        $0.setUpTitle(title: "다음")
        $0.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private func insertUserNameData() {
        guard let userName = inputUserNameTextField.text else { return }
        let userInfo = SignUpModel.share
        userInfo.userName = userName
    }
    
    @objc private func nextButtonDidTap(_ sender: UIButton) {
        insertUserNameData()
        viewModel.pushInputUserAddressVC()
    }
    
    override func addView() {
        view.addSubViews(descriptionPageLabel, inputUserNameTextField, nextbutton)
    }
    
    override func setLayout() {
        descriptionPageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(190)
            $0.leading.trailing.equalToSuperview().inset(71)
        }
        
        inputUserNameTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionPageLabel.snp.bottom).offset(101)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        nextbutton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}
