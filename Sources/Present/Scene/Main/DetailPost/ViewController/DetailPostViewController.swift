//
//  DetailPostViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/22.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class DetailPostViewController: BaseVC<DetailPostViewModel> {
    private let postImageView = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let postTitle = UILabel().then {
        $0.text = "title"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let postLocation = UILabel().then {
        $0.text = "location"
    }
    
    private let postDescriptionLabel = UILabel().then {
        $0.text = "description"
        $0.textColor = FindMeAsset.Colors.postBodyTextColor.color
    }
    
    override func addView() {
        view.addSubViews(postImageView, postTitle, postLocation)
    }
    
    override func setLayout() {
        postImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.size.equalTo(360)
        }
        
        postTitle.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(12)
        }
        
        postLocation.snp.makeConstraints {
            $0.top.equalTo(postTitle.snp.bottom).offset(4)
            $0.leading.equalTo(postTitle.snp.leading).offset(2)
        }
    }
}
