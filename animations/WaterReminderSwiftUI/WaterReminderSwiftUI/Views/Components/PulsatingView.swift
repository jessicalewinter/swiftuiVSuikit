//
//  PulsatingView.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 03/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct PulsatingView: View {
    @State private var pulsate = false
    var colors: [Color] = [Color.pulsatingColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pulsatingColor)
                .frame(width: 195, height: 195)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
                .onAppear {
                    self.pulsate.toggle()
                }
        }
    }
}

struct PulsatingView_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingView()
    }
}
