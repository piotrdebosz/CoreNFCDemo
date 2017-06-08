//
//  SectionHeaderView.swift
//  NFCDemo
//
//  Created by FR on 11/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import UIKit
import SnapKit

class SectionHeaderView: UIView {
    
    init(section: Int) {
        super.init(frame: .zero)
        
        self.backgroundColor = .black
        
        let label = UILabel()
        self.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        label.text = "Message number: \(section)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
