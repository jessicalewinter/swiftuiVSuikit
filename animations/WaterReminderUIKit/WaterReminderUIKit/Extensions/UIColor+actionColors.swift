//
//  UIColor+actionColors.swift
//  WaterReminderUIKit
//
//  Created by Jessica Lewinter on 02/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let mainBlue = UIColor.rgb(red: 12, green: 35, blue: 64)
    static let backgroundColor = UIColor.rgb(red: 21, green: 22, blue: 33)
    static let outlineStrokeColor = UIColor.rgb(red: 63, green: 255, blue: 201)
    static let pulsatingFillColor = UIColor.rgb(red: 149, green: 200, blue: 216)
}
