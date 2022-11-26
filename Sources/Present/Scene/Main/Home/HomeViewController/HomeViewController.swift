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

    private let itemsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private lazy var floatingButton = UIButton().then {
        $0.titleLabel?.contentMode = .center
        $0.layer.cornerCurve = .circular
        $0.backgroundColor = FindMeAsset.Colors.findmeMainColor.color
        $0.setTitle("+", for: .normal)
        $0.layer.cornerRadius = 20
    }
    
    private func bindCollectionview() {
        findAllData.bind(to: itemsCollectionView.rx.items(cellIdentifier: ItemsCollectionViewCell.identifier, cellType: ItemsCollectionViewCell.self)) { (row, data, cell) in
            cell.addFindAllData(with: data)
        }.disposed(by: disposeBag)
        
        itemsCollectionView.rx.modelSelected(HomeModel.self)
            .subscribe { [weak self] member in
                
            }
    }
    
    override func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "전체보기"
        
        viewModel.delegate = self
        itemsCollectionView.delegate = self
        itemsCollectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: ItemsCollectionViewCell.identifier)
        bindCollectionview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.findAllItems()
    }
    
    override func addView() {
        view.addSubViews(profileButton, itemsCollectionView, floatingButton)
    }
    
    override func setLayout() {
        profileButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(-45)
            $0.trailing.equalToSuperview().inset(15)
        }
        itemsCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
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
