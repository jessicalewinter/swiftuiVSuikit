//
//  ContentView.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 22/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var timerIsPaused: Bool = true

    @State var timer: Timer? = nil
    let calendar = Calendar.current
    let date = Date()


    var body: some View {
        VStack {
            Text("\(hours):\(minutes):\(seconds)")
            
            if timerIsPaused {
                HStack {
                    Button(action:{
                        print("RESTART")
                    }) {
                        Image(systemName: "backward.end.alt")
                            .padding(.all)
                    }
                    .padding(.all)
                    
                    Button(action:{
                        self.startTimer()
                        print("START")
                    }){
                        Image(systemName: "play.fill")
                            .padding(.all)
                    }
                    .padding(.all)
                }
            } else {
                Button(action:{
                    print("STOP")
                    self.stopTimer()
                }){
                Image(systemName: "stop.fill")
                    .padding(.all)
                }
                .padding(.all)
            }
        }
    }

    func startTimer() {
        timerIsPaused = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            
            if self.seconds == 59 {
                self.seconds = 0
                
                if self.minutes == 59 {
                  self.minutes = 0
                  self.hours = self.hours + 1
                } else {
                  self.minutes = self.minutes + 1
                }
            } else {
                self.seconds = self.seconds + 1
            }
        }
    }

    func stopTimer(){
        timerIsPaused = true
        timer?.invalidate()
        timer = nil
    }
    
    func restartTimer(){
        hours = 0
        minutes = 0
        seconds = 0
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
