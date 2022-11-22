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
import Kingfisher

class ItemsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemsCollectionViewCell"
    
    private let itemsImage = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.backgroundColor = .gray
    }
    
    private let itemsTitle = UILabel().then {
        $0.text = "Title"
        $0.font = .boldSystemFont(ofSize: 13)
    }
    
    private let itemsLocation = UILabel().then {
        $0.text = "Location Information"
        $0.font = .systemFont(ofSize: 11)
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func addFindAllData(with data: HomeModel) {
        if let imageUrl = URL(string: data.lostImages[0]) {
            itemsImage.kf.setImage(with: imageUrl)
        }
        itemsTitle.text = data.title
        itemsLocation.text = data.place
    }
}
