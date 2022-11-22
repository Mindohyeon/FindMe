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
    
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(stackViewButtonDidTap(_:)))
    
    private lazy var stackView = UIStackView(arrangedSubviews: [allButton, electronicsButton,preciousMetalsButton,
                                                                clothingButton, householdGoodsButton, etcButton]).then {
        $0.addGestureRecognizer(tapGesture)
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.axis = .horizontal
    }
    
    private let itemsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private lazy var allButton = UIButton().then {
        $0.tag = 0
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var electronicsButton = UIButton().then {
        $0.tag = 1
        $0.setTitle("전자기기", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var preciousMetalsButton = UIButton().then {
        $0.tag = 2
        $0.setTitle("귀금속", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var clothingButton = UIButton().then {
        $0.tag = 3
        $0.setTitle("의류", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var householdGoodsButton = UIButton().then {
        $0.tag = 4
        $0.setTitle("생활 용품", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var etcButton = UIButton().then {
        $0.tag = 5
        $0.setTitle("기타", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var floatingButton = UIButton().then {
        $0.layer.cornerCurve = .circular
        $0.backgroundColor = FindMeAsset.Colors.findmeMainColor.color
        $0.setTitle("+", for: .normal)
        $0.layer.cornerRadius = 20
//        $0.layer.cornerRadius = 0.5 * $0.bounds.size.width
    }
    
    private func bindCollectionview() {
        findAllData.bind(to: itemsCollectionView.rx.items(cellIdentifier: ItemsCollectionViewCell.identifier, cellType: ItemsCollectionViewCell.self)) { (row, data, cell) in
            cell.addFindAllData(with: data)
        }.disposed(by: disposeBag)
    }
    
    @objc private func stackViewButtonDidTap(_ sendeer: UIButton) {
        print(sendeer.tag)
    }
    
    override func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "찾고있는 물건들"
        
        itemsCollectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: ItemsCollectionViewCell.identifier)
        itemsCollectionView.delegate = self
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.findAllItems()
        bindCollectionview()
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

//extension HomeViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 7
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionViewCell.identifier, for: indexPath) as? ItemsCollectionViewCell else { return UICollectionViewCell() }
//
//        return cell
//    }
//}

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
