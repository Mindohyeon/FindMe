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
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let postLocation = UILabel().then {
        $0.textColor = FindMeAsset.Colors.postBodyTextColor.color
    }
    
    override func addView() {
        view.addSubViews(postImageView, postTitle, postLocation)
    }
    
    override func setLayout() {
        <#code#>
    }
}
