//
//  MainViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: BaseVC<HomeViewModel>, findAllPresentable {
    var findAllData = PublishSubject<[HomeModel]>()
    
    private let disposeBag = DisposeBag()
    
    private let profileButton = UIButton().then {
        $0.setImage(UIImage(named: FindMeAsset.Images.profileIcon.name)?.resize(newWidth: 35), for: .normal)
    }
    
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    
    private lazy var stackView = UIStackView(arrangedSubviews: [allButton, electronicsButton,preciousMetalsButton,
                                                                clothingButton, householdGoodsButton, etcButton]).then {
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.axis = .horizontal
    }
    
    private let itemsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private lazy var allButton = UIButton().then {
        $0.tag = 0
        $0.addTarget(self, action: #selector(allButtonDidTap(_:)), for: .touchUpInside)
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(FindMeAsset.Colors.darkGrey.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var electronicsButton = UIButton().then {
        $0.addTarget(self, action: #selector(electronicsButtonDidTap(_:)), for: .touchUpInside)
        $0.tag = 1
        $0.setTitle("전자기기", for: .normal)
        $0.setTitleColor(FindMeAsset.Colors.darkGrey.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var preciousMetalsButton = UIButton().then {
        $0.addTarget(self, action: #selector(preciousMetalsButtonDidTap(_:)), for: .touchUpInside)
        $0.tag = 2
        $0.setTitle("귀금속", for: .normal)
        $0.setTitleColor(FindMeAsset.Colors.darkGrey.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var clothingButton = UIButton().then {
        $0.addTarget(self, action: #selector(clothingButtonDidTap(_:)), for: .touchUpInside)
        $0.tag = 3
        $0.setTitle("의류", for: .normal)
        $0.setTitleColor(FindMeAsset.Colors.darkGrey.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var householdGoodsButton = UIButton().then {
        $0.addTarget(self, action: #selector(householdGoodsButtonDidTap(_:)), for: .touchUpInside)
        $0.tag = 4
        $0.setTitle("생활 용품", for: .normal)
        $0.setTitleColor(FindMeAsset.Colors.darkGrey.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var etcButton = UIButton().then {
        $0.addTarget(self, action: #selector(etcButtonDidTap(_:)), for: .touchUpInside)
        $0.tag = 5
        $0.setTitle("기타", for: .normal)
        $0.setTitleColor(FindMeAsset.Colors.darkGrey.color, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var floatingButton = UIButton().then {
        $0.titleLabel?.contentMode = .center
        $0.layer.cornerCurve = .circular
        $0.backgroundColor = FindMeAsset.Colors.findmeMainColor.color
        $0.setTitle("+", for: .normal)
        $0.layer.cornerRadius = 20
    }
    
    @objc private func allButtonDidTap(_ sender: UIButton) {
        print(stackView.tag)
        allButton.setTitleColor(.black, for: .normal)
    }
    
    @objc private func electronicsButtonDidTap(_ sender: UIButton) {
        electronicsButton.setTitleColor(.black, for: .normal)
    }
    
    @objc private func preciousMetalsButtonDidTap(_ sender: UIButton) {
        print(stackView.tag)
        preciousMetalsButton.setTitleColor(.black, for: .normal)
    }
    
    @objc private func clothingButtonDidTap(_ sender: UIButton) {
        clothingButton.setTitleColor(.black, for: .normal)
    }
    
    @objc private func householdGoodsButtonDidTap(_ sender: UIButton) {
        householdGoodsButton.setTitleColor(.black, for: .normal)
    }
    
    @objc private func etcButtonDidTap(_ sender: UIButton) {
        etcButton.setTitleColor(.black, for: .normal)
    }
    
    private func bindCollectionview() {
        findAllData.bind(to: itemsCollectionView.rx.items(cellIdentifier: ItemsCollectionViewCell.identifier, cellType: ItemsCollectionViewCell.self)) { (row, data, cell) in
            cell.addFindAllData(with: data)
        }.disposed(by: disposeBag)
    }
    
    override func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "찾고있는 물건들"
        
        viewModel.delegate = self
        itemsCollectionView.delegate = self
        itemsCollectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: ItemsCollectionViewCell.identifier)
        bindCollectionview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.findAllItems()
    }
    
    override func addView() {
        view.addSubViews(stackView, profileButton, itemsCollectionView, floatingButton)
    }
    
    override func setLayout() {
        profileButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(-45)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            $0.height.equalTo(50)
        }
        
        itemsCollectionView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        allButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        electronicsButton.snp.makeConstraints {
            $0.leading.equalTo(allButton.snp.trailing)
        }
        
        preciousMetalsButton.snp.makeConstraints {
            $0.leading.equalTo(electronicsButton.snp.trailing)
        }
        
        clothingButton.snp.makeConstraints {
            $0.leading.equalTo(preciousMetalsButton.snp.trailing)
        }
        
        householdGoodsButton.snp.makeConstraints {
            $0.leading.equalTo(clothingButton.snp.trailing)
        }
        
        etcButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(5)
        }
        
        floatingButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
            $0.trailing.equalToSuperview().offset(-20)
            $0.size.equalTo(40)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 10
        
        return CGSize(width: width, height: 250)
    }
}
