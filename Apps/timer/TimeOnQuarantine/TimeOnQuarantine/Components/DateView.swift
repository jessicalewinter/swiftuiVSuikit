//
//  DateView.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct DateView: View {
    var number: Int
    var title: String
    var fontType: Font
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("\(self.number)")
                    .frame(maxWidth: geometry.size.width*0.9)
                    .font(self.fontType.bold())
                    
                Text("\(self.title)")
                .frame(maxWidth: geometry.size.width*0.9)
                    .font(self.fontType)
            }
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(number: 10, title: "mnth", fontType: .title)
    }
}
