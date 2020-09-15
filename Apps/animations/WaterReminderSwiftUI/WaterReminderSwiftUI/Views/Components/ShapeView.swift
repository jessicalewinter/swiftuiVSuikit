//
//  ShapeView.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 03/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct ShapeView: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color.outlineColor]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 200, height: 200)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(
                            style: StrokeStyle(lineWidth: 20,
                                               lineCap: .round,
                                               lineJoin: .round))
                        .fill(AngularGradient(gradient: Gradient(colors: colors), center: .center, startAngle: .zero, endAngle: Angle(degrees: 360)))
                    .rotationEffect(Angle(degrees: 270))
                )
                .animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
