//
//  InputAddressViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class InputUserAddressViewController: BaseVC<InputUserAddressViewModel>, AddressPresentable {
    var addressData = PublishSubject<[Juso]>()
    private let addressTableView = UITableView()
    private let disposeBag = DisposeBag()
    private let userInfo = SignUpModel.share
    
    private let descriptionPageLabel = UILabel().then {
        $0.text = "분실물 배송을 위해 주소를 입력해주세요."
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    private let inputUserAddressTextField = UnderLineTextField().then {
        $0.setPlaceholder(placeholder: "주소를 입력해주세요.")
        $0.textColor = .black
    }
    
    private lazy var addressSearchButton = UIButton().then {
        $0.setTitle("주소찾기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setTitleColor(FindMeAsset.Colors.findmeMainColor.color, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(searchAddress(_:)), for: .touchUpInside)
    }
    
    private lazy var completeButton = CustomButton().then {
        $0.setUpTitle(title: "완료")
        $0.addTarget(self, action: #selector(completeButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private func bindTableView() {
        addressData.bind(to: addressTableView.rx.items(cellIdentifier: AddressTableViewCell.identifier, cellType: AddressTableViewCell.self)) { (row, address, cell) in
            cell.selectionStyle = .gray
            cell.configure(with: address)
        }
        .disposed(by: disposeBag)
        
        addressTableView.rx.modelSelected(Juso.self)
            .subscribe(onNext: { [weak self] member in
                self?.userInfo.address = member.roadAddr
            }).disposed(by: disposeBag)
    }
    
    @objc private func searchAddress(_ sender: UIButton) {
        guard let address = inputUserAddressTextField.text else { return }
        viewModel.getAddress(address: address)
        print(addressData)
    }
    
    @objc private func completeButtonDidTap(_ sender: UIButton) {
        viewModel.fetch()
    }
    
    override func configureVC() {
        viewModel.delegate = self
        addressTableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.identifier)
        bindTableView()
    }
    
    override func addView() {
        view.addSubViews(descriptionPageLabel, inputUserAddressTextField, addressSearchButton, completeButton, addressTableView)
    }
    
    override func setLayout() {
        descriptionPageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(199)
            $0.leading.trailing.equalToSuperview().inset(52)
        }
        
        inputUserAddressTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionPageLabel.snp.bottom).offset(111)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        addressSearchButton.snp.makeConstraints {
            $0.top.equalTo(inputUserAddressTextField).offset(-3)
            $0.trailing.equalTo(inputUserAddressTextField.snp.trailing)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(64)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
        
        addressTableView.snp.makeConstraints {
            $0.top.equalTo(inputUserAddressTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(completeButton.snp.top).offset(-130)
        }
    }
}
