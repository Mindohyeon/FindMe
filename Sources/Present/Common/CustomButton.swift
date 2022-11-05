//
//  CustomButton.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/05.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//
import UIKit

class CustomButton: BaseButton {
    override func setupView() {
        super.setupView()
        setTitleColor(.white, for: .normal)
    }
    
    func setUpTitle(title: String) {
        setTitle(title, for: .normal)
    }
}
