//
//  StartTimeView.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 28/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct StartTimeView: View {
   
    @State var quarantineDate: Date
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Text("Start date of your isolation")
                        .font(.title)
                        .padding(.vertical, 20)
                        .frame(maxWidth: geometry.size.width - 20)
                    Text("..with no friends, no drinking, no games")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    DatePicker("", selection: self.$quarantineDate, in: ...Date(), displayedComponents: .date).padding(30)
                    
                    NavigationLink(destination: QuarantineDurationView(date: self.quarantineDate)) {
                        TitleDefault(
                            width: geometry.size.width * 0.7,
                            title: "NEXT")
                    }
                    
                    Spacer()
                }
                .navigationBarTitle("Quarantine Timer", displayMode: .inline)
            }
        }
    }
}

struct StartTimeView_Previews: PreviewProvider {
    static var previews: some View {
        StartTimeView(quarantineDate: Date())
    }
}
