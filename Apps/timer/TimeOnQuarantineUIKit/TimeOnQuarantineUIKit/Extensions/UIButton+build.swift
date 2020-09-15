//
//  UIButton+build.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(with title: String, and color: UIColor) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        backgroundColor = color
        layer.cornerRadius = 15
        titleLabel?.font = UIFont(name: "Futura", size: 20)
    }
}
