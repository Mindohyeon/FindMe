//
//  addressTableViewCell.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/15.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class AddressTableViewCell: baseTableViewCell<Juso> {
    static let identifier = "AddressTableViewCell"
    
    private let roadName = UILabel().then {
        $0.text = "도로명"
        $0.font = .systemFont(ofSize: 13)
    }
    
    private let inputRoadName = UILabel().then {
        $0.text = "asfdaf"
        $0.font = .systemFont(ofSize: 13)
    }
    
    func configure(with address: Juso) {
        inputRoadName.text = address.roadAddr
    }
    
    override func addView() {
        contentView.addSubViews(roadName, inputRoadName)
    }
    
    override func setLayout() {
        roadName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(23)
        }
        
        inputRoadName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(roadName.snp.trailing).offset(18)
        }
    }
}
