//
//  ContentView.swift
//  WaterReminderSwiftUI
//
//  Created by Jessica Lewinter on 02/08/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DailyView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
