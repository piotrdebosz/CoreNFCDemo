//
//  RecordTableViewCell.swift
//  NFCDemo
//
//  Created by Piotr Dębosz on 08/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import UIKit
import SnapKit

class RecordTableViewCell: UITableViewCell {
    private let typeLabel: UILabel = UILabel()
    private let identifierLabel: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubviews() {
        self.backgroundColor = .white
        
        self.addSubview(self.identifierLabel)
        
        self.identifierLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-32)
        }
        
        self.addSubview(self.typeLabel)
        
        self.typeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.identifierLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.identifierLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.typeLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        self.accessoryType = .disclosureIndicator
    }    
}

extension RecordTableViewCell {
    func configure(identifier: String?, type: String?) {
        self.identifierLabel.text = "Identifier: \(identifier ?? "")"
        self.typeLabel.text = "Type: \(type ?? "")"
    }
}
