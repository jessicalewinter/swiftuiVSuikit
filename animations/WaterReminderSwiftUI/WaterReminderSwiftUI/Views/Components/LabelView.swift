//
//  LabelView.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 03/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct LabelView: View {
    var percentage: CGFloat = 10
    
    var body: some View {
        ZStack {
            if percentage == 0 {
                Text("Start")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            } else {
                Text("\(Int(percentage))%")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}