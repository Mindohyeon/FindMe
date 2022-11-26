//
//  DetailPostViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/22.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import Kingfisher

class DetailPostViewController: BaseVC<DetailPostViewModel> {
    private let postImageView = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let postTitleLabel = UILabel().then {
        $0.text = "title"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let postLocationLabel = UILabel().then {
        $0.text = "location"
    }
    
    private let postDescriptionLabel = UILabel().then {
        $0.text = "description"
        $0.textColor = FindMeAsset.Colors.postBodyTextColor.color
    }
    
    func fetch(with model: HomeModel) {
        DispatchQueue.main.async {
            if let imageUrl = URL(string: model.imageUrl[0]) {
                self.postImageView.kf.setImage(with: imageUrl)
            }
            self.postTitleLabel.text = model.title
            self.postLocationLabel.text = model.place
            self.postDescriptionLabel.text = model.description
        }
    }
    
    override func addView() {
        view.addSubViews(postImageView, postTitleLabel, postLocationLabel)
    }
    
    override func setLayout() {
        postImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.size.equalTo(360)
        }
        
        postTitleLabel.snp.makeConstraints {
            $0.top.equalTo(postImageView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(12)
        }
        
        postLocationLabel.snp.makeConstraints {
            $0.top.equalTo(postTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(postTitleLabel.snp.leading).offset(2)
        }
    }
}
