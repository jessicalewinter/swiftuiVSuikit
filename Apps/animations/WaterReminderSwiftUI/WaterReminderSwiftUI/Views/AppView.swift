//
//  AppView.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 03/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            DailyView()
                .tabItem {
                    Image("water-glass")
                    Text("Daily")
            }
        }.accentColor(.black)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
