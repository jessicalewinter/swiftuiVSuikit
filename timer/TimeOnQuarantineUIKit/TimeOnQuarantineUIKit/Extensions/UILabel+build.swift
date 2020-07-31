//
//  UILabel+build.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UILabel {
    private func commonSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textAlignment = .center
    }
    
    convenience init(with title: String, ofType fontType: UIFont.TextStyle, and color: UIColor) {
        self.init()
        commonSetup()
        text = title
        font = UIFont.preferredFont(forTextStyle: fontType)
        textColor = color
    }
    
    convenience init(with title: String, ofSize size: CGFloat, and color: UIColor) {
        self.init()
        commonSetup()
        text = title
        font = UIFont.systemFont(ofSize: size)
        textColor = color
    }
    
    convenience init(with title: String, ofTypeBold fontType: UIFont.TextStyle, and color: UIColor) {
        self.init()
        commonSetup()
        text = title
        font = UIFont.preferredFont(forTextStyle: fontType).bold
        textColor = color
    }
}
