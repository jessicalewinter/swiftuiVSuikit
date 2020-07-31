//
//  CounterDateView.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 31/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class StackDateView: UIView {
    
    var stackDateView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StackDateView: ViewCodable {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
}
