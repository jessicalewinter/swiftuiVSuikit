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
    var action: (() -> Void)?
    
    var body: some View {
        
        Button(title) {
            self.action?()
        }
            .accentColor(.black)
            .font((Font.custom("Futura", size: 20)))
            .frame(width: width, height: 50)
            .background(Color.orange)
            .cornerRadius(15)
            .padding(20)
    }
}

struct ButtonDefault_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDefault(width: 200, title: "e ai")
    }
}
