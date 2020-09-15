//
//  DailyView.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 03/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct DailyView: View {
    let dailyWaterRecommended: CGFloat = 2000
    @State var percentage: CGFloat = 0
    @State var initialDailyWater: CGFloat = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Your daily amount of water is \(Int(dailyWaterRecommended))ml")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, -50)
                    .multilineTextAlignment(.center)
                    
                
                Spacer()
                
                ZStack {
                    PulsatingView()
                    TrackView()
                    LabelView(percentage: percentage)
                    ShapeView(percentage: percentage)
                }
                
                Spacer()
                
                Button(action: {
                    self.initialDailyWater += 200
                    self.percentage = (self.initialDailyWater / self.dailyWaterRecommended) * 100
                    print(self.initialDailyWater)
                    print(self.percentage)
                }) {
                    VStack {
                        Image("addWater")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                        Text("200ml")
                    }
                }
                .accentColor(.white)
                .frame(width: 100, height: 100)
                .background(Color.trackColor)
                .clipShape(Circle())
                .padding(.bottom, 20)
            }
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
