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
    var model: HomeModel?
    
    private let postImageView = UIImageView().then {
        $0.backgroundColor = .gray
    }
    
    private let postTitleLabel = UILabel().then {
        $0.text = "title"
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let postLocationLabel = UILabel().then {
        $0.text = "location"
        $0.font = .systemFont(ofSize: 14)
    }
    
    private let postDescriptionLabel = UILabel().then {
        $0.text = "description"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = FindMeAsset.Colors.postBodyTextColor.color
    }
    
    private lazy var findButton = CustomButton().then {
        $0.setUpTitle(title: "찾았어요!")
        $0.addTarget(self, action: #selector(findButtonDidTap(_:)), for: .touchUpInside)
    }
    
    init(viewModel: DetailPostViewModel, model: HomeModel) {
        super.init(viewModel: viewModel)
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func findButtonDidTap(_ sender: UIButton) {
        print("jj")
    }
    
    func fetch(data model: HomeModel) {
        
        print("model place = \(model.place)")
        
        DispatchQueue.main.async {
            if let imageUrl = URL(string: model.imageUrl[0]) {
                self.postImageView.kf.setImage(with: imageUrl)
            }
            self.postTitleLabel.text = model.title
            self.postLocationLabel.text = model.place
            self.postDescriptionLabel.text = model.description
        }
    }
    
    override func configureVC() {
        fetch(data: model!)
    }
    
    override func addView() {
        view.addSubViews(postImageView, postTitleLabel, postLocationLabel, postDescriptionLabel, findButton)
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
        
        postDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(postLocationLabel.snp.bottom).offset(16)
            $0.leading.equalTo(postLocationLabel.snp.leading)
        }
        
        findButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}
