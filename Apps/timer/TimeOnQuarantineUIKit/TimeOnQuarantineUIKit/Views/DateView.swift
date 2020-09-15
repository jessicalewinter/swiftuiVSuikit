//
//  DateView.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 31/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class DateView: UIView {
    var text: String
    var detail: String
    var type: UIFont.TextStyle
    
    lazy var dateText: UILabel = {
        let label = UILabel(with: self.text, ofTypeBold: self.type, and: .black)
        return label
    }()
    
    lazy var detailText: UILabel = {
        let label = UILabel(with: self.detail, ofType: self.type, and: .black)
        return label
    }()
    
    init(text: String, detail: String, type: UIFont.TextStyle) {
        self.text = text
        self.detail = detail
        self.type = type
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DateView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(dateText)
        addSubview(detailText)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dateText.topAnchor.constraint(equalTo: topAnchor),
            dateText.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailText.topAnchor.constraint(equalTo: dateText.bottomAnchor),
            detailText.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
