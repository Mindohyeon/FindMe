//
//  MainViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/09.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import Tabman

class HomeViewController: BaseVC<HomeViewModel> {
    private let viewControllers = ["전체", "전자기기", "귀금속", "의류", "생활용품", "기타"]
    
    override func configureVC() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "찾고있는 물건들"
    }
}
