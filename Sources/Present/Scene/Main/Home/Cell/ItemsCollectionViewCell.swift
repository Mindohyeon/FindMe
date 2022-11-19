//
//  ItemsCollectionViewCell.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/19.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import SnapKit
import Then

class ItemsCollectionViewCell: UICollectionViewCell {
    private let itemsImage = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let itemsTitle = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 13)
    }
    
    private let itemsLocation = UILabel().then {
        $0.font = .systemFont(ofSize: 11)
        $0.numberOfLines = 0
    }
    
    private func addView() {
        contentView.addSubViews(itemsImage, itemsTitle, itemsLocation)
    }
    
    private func setLayout() {
        itemsImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.size.equalTo(163)
        }
        
        itemsTitle.snp.makeConstraints {
            $0.top.equalTo(itemsImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        itemsLocation.snp.makeConstraints {
            $0.top.equalTo(itemsTitle.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
    }
}
