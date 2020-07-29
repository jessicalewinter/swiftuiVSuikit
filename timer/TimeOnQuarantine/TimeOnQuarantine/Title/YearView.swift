//
//  YearView.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct YearView: View {
    var number: Int
    var title: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("\(self.number)")
                    .frame(maxWidth: geometry.size.width*0.9)
                    .font(.title)
                Text("\(self.title)")
                .frame(maxWidth: geometry.size.width*0.9)
                .font(.title)
            }
        }
    }
}

struct YearView_Previews: PreviewProvider {
    static var previews: some View {
        YearView(number: 10, title: "mnth")
    }
}
