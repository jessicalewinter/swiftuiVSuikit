//
//  Color+actionColors.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 03/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

extension Color {
    static func rgb(red: Double, green: Double, blue: Double) -> Color {
        return Color(red: red/255, green: green/255, blue: blue/255)
    }
    
    static let backgroundColor = Color.rgb(red: 21, green: 22, blue: 33)
    static let trackColor = Color.rgb(red: 12, green: 35, blue: 64)
    static let outlineColor = Color.rgb(red: 63, green: 255, blue: 201)
    static let pulsatingColor = Color.rgb(red: 149, green: 200, blue: 216)
}
