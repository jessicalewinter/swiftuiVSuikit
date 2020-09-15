//
//  ButtonDefault.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct ButtonDefault: View {
    var width: CGFloat
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(title)
                .multilineTextAlignment(.center)
        }
            .accentColor(.white)
            .font((Font.custom("Futura", size: 20)))
            .frame(maxWidth: width, minHeight: 50, alignment: .center)
            .padding(10)
            .background(Color.orange)
            .cornerRadius(15)
    }
}

struct ButtonDefault_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDefault(width: 200, title: "e sahushaushauhs shuahasuhaai") {
            print("tudo bem")
        }
    }
}
