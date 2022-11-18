//
//  MainViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class HomeViewController: BaseVC<HomeViewModel> {
    
    private let profileButton = UIButton().then {
        $0.setImage(UIImage(named: FindMeAsset.Images.profileIcon.name)?.resize(newWidth: 35), for: .normal)
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [allButton, electronicsButton,preciousMetalsButton,
                                                                clothingButton, householdGoodsButton, etcButton]).then {
        $0.alignment = .fill
        $0.axis = .horizontal
    }
    
    private lazy var allButton = UIButton().then {
        $0.setTitle("전체", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var electronicsButton = UIButton().then {
        $0.setTitle("전자기기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var preciousMetalsButton = UIButton().then {
        $0.setTitle("귀금속", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var clothingButton = UIButton().then {
        $0.setTitle("의류", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var householdGoodsButton = UIButton().then {
        $0.setTitle("생활 용품", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var etcButton = UIButton().then {
        $0.setTitle("기타", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    override func configureVC() {
        view.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "찾고있는 물건들"
    }
    
    override func addView() {
        view.addSubViews(stackView, profileButton)
    }
    
    override func setLayout() {
        profileButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(-45)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(50)
        }
        
        allButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        electronicsButton.snp.makeConstraints {
            $0.leading.equalTo(allButton.snp.trailing).offset(3)
        }
        
        preciousMetalsButton.snp.makeConstraints {
            $0.leading.equalTo(electronicsButton.snp.trailing).offset(3)
        }
        
        clothingButton.snp.makeConstraints {
            $0.leading.equalTo(preciousMetalsButton.snp.trailing).offset(3)
        }
        
        householdGoodsButton.snp.makeConstraints {
            $0.leading.equalTo(clothingButton.snp.trailing).offset(3)
        }
        
        etcButton.snp.makeConstraints {
            $0.leading.equalTo(householdGoodsButton.snp.trailing)
        }
    }
}
