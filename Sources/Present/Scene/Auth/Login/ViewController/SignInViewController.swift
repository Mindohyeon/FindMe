//
//  SignUpViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/04.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//
import UIKit

class SignInViewController: BaseVC<SignInViewModel> {
    private let logoImageView = UIImageView().then {
        $0.image = FindMeAsset.Images.projectLogoImage.image
    }
}
