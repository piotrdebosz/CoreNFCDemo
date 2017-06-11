//
//  DetailViewController.swift
//  NFCDemo
//
//  Created by Piotr Dębosz on 08/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import UIKit
import SnapKit
import CoreNFC

class DetailViewController: UIViewController {
    private let record: NFCNDEFPayload
    
    private let typeNameFormatLabel: UILabel = UILabel()
    private let typeLabel: UILabel = UILabel()
    private let identifierLabel: UILabel = UILabel()
    private let payloadLabel: UILabel = UILabel()
    
    private let scrollView: UIScrollView = UIScrollView()
    private let mainView: UIView = UIView()
    
    init(record: NFCNDEFPayload) {
        self.record = record
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setUpSubviews()
    }
    
    private func setUpSubviews() {
        self.setUpScrollView()
        self.setUpTypeNameFormatLabels()
        self.setUpTypeLabels()
        self.setUpIdentifierLabels()
        self.setUpPayloadLabels()
        
        self.typeNameFormatLabel.text = self.record.typeNameFormatString()
        self.typeLabel.text = self.record.typeString()
        self.identifierLabel.text = self.record.identifierString()
        self.payloadLabel.text = self.record.payloadString()
    }
    
    private func setUpTypeNameFormatLabels() {
        let typeNameFormatHeaderLabel = UILabel()
        
        self.mainView.addSubview(typeNameFormatHeaderLabel)
        
        typeNameFormatHeaderLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset( -16)
        }
        
        typeNameFormatHeaderLabel.text = "Type name format"
        typeNameFormatHeaderLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        self.mainView.addSubview(self.typeNameFormatLabel)
        
        self.typeNameFormatLabel.snp.makeConstraints { (make) in
            make.top.equalTo(typeNameFormatHeaderLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.typeNameFormatLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.typeNameFormatLabel.numberOfLines = 0
    }
    
    private func setUpTypeLabels() {
        let typeHeaderLabel = UILabel()
        
        self.mainView.addSubview(typeHeaderLabel)
        
        typeHeaderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeNameFormatLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset( -16)
        }
        
        typeHeaderLabel.text = "Type"
        typeHeaderLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        self.mainView.addSubview(self.typeLabel)
        
        self.typeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(typeHeaderLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.typeLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.typeLabel.numberOfLines = 0
    }
    
    private func setUpIdentifierLabels() {
        let identifierHeaderLabel = UILabel()
        
        self.mainView.addSubview(identifierHeaderLabel)
        
        identifierHeaderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset( -16)
        }
        
        identifierHeaderLabel.text = "Identifier"
        identifierHeaderLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        self.mainView.addSubview(self.identifierLabel)
        
        self.identifierLabel.snp.makeConstraints { (make) in
            make.top.equalTo(identifierHeaderLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.identifierLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.identifierLabel.numberOfLines = 0
    }
    
    private func setUpPayloadLabels() {
        let payloadHeaderLabel = UILabel()
        
        self.mainView.addSubview(payloadHeaderLabel)
        
        payloadHeaderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.identifierLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset( -16)
        }
        
        payloadHeaderLabel.text = "Payload"
        payloadHeaderLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        self.mainView.addSubview(self.payloadLabel)
        
        self.payloadLabel.snp.makeConstraints { (make) in
            make.top.equalTo(payloadHeaderLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        self.payloadLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.payloadLabel.numberOfLines = 0
    }
    
    private func setUpScrollView() {
        self.view.addSubview(scrollView)
        
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.mainView)
        
        self.mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(self.view.snp.width)
        }
    }
}
