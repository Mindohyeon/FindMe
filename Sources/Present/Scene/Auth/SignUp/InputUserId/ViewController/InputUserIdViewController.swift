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
        $0.font = .systemFont(ofSize: 16)
        $0.text = "분실물 배송 및 보안을 위해\n 이름(실명)을 입력해주세요."
    }
    
    override func addView() {
        view.addSubViews(descriptionPageLabel)
    }
    
    override func setLayout() {
        descriptionPageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(190)
            $0.leading.trailing.equalToSuperview().inset(71)
        }
    }
}
