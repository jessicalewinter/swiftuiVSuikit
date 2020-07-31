//
//  TitleDefault.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 28/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct TitleDefault: View {
    var width: CGFloat
    var title: String
    
    var body: some View {
        
        Text(title)
            .accentColor(.white)
            .font((Font.custom("Futura", size: 20)))
            .frame(width: width, height: 50)
            .background(Color.orange)
            .cornerRadius(15)
            .padding(20)
    }
}

struct TitleDefault_Previews: PreviewProvider {
    static var previews: some View {
        TitleDefault(width: 200, title: "e ai")
    }
}
