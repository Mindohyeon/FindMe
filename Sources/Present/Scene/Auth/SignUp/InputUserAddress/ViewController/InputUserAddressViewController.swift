//
//  InputAddressViewController.swift
//  FindMe
//
//  Created by 민도현 on 2022/11/07.
//  Copyright © 2022 com.dohyeon. All rights reserved.
//

import UIKit

class InputUserAddressViewController: BaseVC<InputUserAddressViewModel> {
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
    
    private let addressTableView = UITableView()
    
    private let dataSource = [AddressModel]()
    
    private func completeInsertData() {
        guard let address = inputUserAddressTextField.text else { return }
        let userInfo = SignUpModel.share
        userInfo.address = address
    }
    
    @objc private func searchAddress(_ sender: UIButton) {
        guard let address = inputUserAddressTextField.text else { return }
        viewModel.getAddress(address: address)
    }
    
    @objc private func completeButtonDidTap(_ sender: UIButton) {
        completeInsertData()
        viewModel.fetch()
    }
    
    override func configureVC() {
        addressTableView.register(AddressTableViewCell.self, forCellReuseIdentifier: "AddressTableViewCell")
    }
    
    override func addView() {
        view.addSubViews(descriptionPageLabel, inputUserAddressTextField, addressSearchButton, completeButton)
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
    }
}

extension InputUserAddressViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as? AddressTableViewCell else { return UITableViewCell() }
        return cell
    }
}
