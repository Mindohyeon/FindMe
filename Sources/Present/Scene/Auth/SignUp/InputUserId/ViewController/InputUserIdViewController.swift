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
        $0.textColor = .gray
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16)
    }
    
    override func addView() {
        view.addSubViews(descriptionPageLabel)
    }
    
    override func setLayout() {
        descriptionPageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(190)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
    }
}
