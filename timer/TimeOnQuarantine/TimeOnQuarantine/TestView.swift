//
//  TestView.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 28/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @State var now = Date()

    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
        Text("\(now)")
        .onReceive(timer) {_ in
            self.now = Date()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
