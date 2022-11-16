//
//  MainViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {
    private let viewControllers = [AllViewController(), ElectronicViewController(), PreciousMetalsViewController(),
                                   ClothingViewController(), HouseholdGoodsViewController(), EtcViewController()]
    
    private let bar = TMBar.ButtonBar()
    
    private let profileButton = UIButton().then {
        $0.setImage(UIImage(named: FindMeAsset.Images.profileIcon.name)?.resize(newWidth: 35), for: .normal)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureVC()
        addView()
        setLayout()
        
        self.dataSource = self
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
    }
    
    private func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "찾고있는 물건들"
    }
    
    private func addView() {
        view.addSubViews(profileButton)
    }
    
    private func setLayout() {
        profileButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(-45)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    
    func settingTabBar (ctBar : TMBar.ButtonBar) {
//        ctBar.layout.transitionStyle = .snap
//        // 왼쪽 여백주기
//        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 13.0, bottom: 0.0, right: 20.0)
//        // 간격
//        ctBar.layout.interButtonSpacing = 35
//
//        ctBar.backgroundView.style = .blur(style: .light)
//        // 선택 / 안선택 색 + font size
//        ctBar.buttons.customize { (button) in
//            button.tintColor = .black
//            button.selectedTintColor = .black
//            button.font = UIFont.systemFont(ofSize: 16)
//            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
//        }
//
//        // 인디케이터 (영상에서 주황색 아래 바 부분)
//        ctBar.indicator.weight = .custom(value: 2)
//        ctBar.indicator.tintColor = .orange
        ctBar.layout.transitionStyle = .snap
        ctBar.layout.interButtonSpacing = 50
        ctBar.layout.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: -40, right: 0)
        ctBar.buttons.customize {
            $0.font = UIFont.systemFont(ofSize: 17)
            $0.tintColor = .init(red: 0.29, green: 0.26, blue: 0.27, alpha: 1)
            $0.selectedFont = UIFont.systemFont(ofSize: 17)
            $0.selectedTintColor = .black
        }
        ctBar.indicator.weight = .custom(value: 4)
        ctBar.indicator.tintColor = .init(red: 0.94, green: 0.47, blue: 0.62, alpha: 1)
        ctBar.indicator.cornerStyle = .rounded
        ctBar.layout.alignment = .centerDistributed
        ctBar.systemBar().backgroundStyle = .clear
    }
}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        nil
    }
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        var title = ""
        switch index {
        case 0: title = "전체"
        case 1: title = "전자기기"
        case 2: title = "귀금속"
        case 3: title = "의류"
        case 4: title = "생활 용품"
        case 5: title = "기타"
        default:
            title = "default"
        }
        return TMBarItem(title: title)
    }
}
