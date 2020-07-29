//
//  QuarantineDurationView.swift
//  TimeOnQuarantine
//
//  Created by Jessica Lewinter on 28/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import SwiftUI

struct QuarantineDurationView: View {
    var date: Date
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State var year: Int = 0
    @State var month: Int = 0
    @State var day: Int = 0
    
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    
    @State var timerIsPaused: Bool = true

    @State var timer: Timer? = nil
    let calendar = Calendar(identifier: .gregorian)
    
    var components: DateComponents {
        let components = calendar.dateComponents([.calendar, .year, .month, .day, .hour, .minute, .second], from: date, to: Date())
        return components
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                
                Text("Quarantine duration")
                .font(.title)
                .padding(.vertical, 20)
                .frame(maxWidth: geometry.size.width - 20)
                
                
                VStack {
                    Text("Isolated since")
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                    
                    Text("\(self.date, formatter: self.dateFormatter)")
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)
                }
                .padding(.bottom, 20)
                
                
                HStack {
                    YearView(number: self.year, title: "year")
                    Text(":")
                        .font(.title)
                    YearView(number: self.month, title: "month")
                    Text(":")
                        .font(.title)
                    YearView(number: self.day, title: "day")
                }.frame(height: 100)
                
                HStack {
                    DayView(number: self.hours, title: "hrs")
                    Text(":")
                        .font(.largeTitle)
                    DayView(number: self.minutes, title: "min")
                    Text(":")
                        .font(.largeTitle)
                    DayView(number: self.seconds, title: "sec")
                }.frame(height: 100)
                
                
                ButtonDefault(width: geometry.size.width * 0.7, title: "Stop! Finally found a vaccine") {
                    print("e ai")
                    self.stopTimer()
                }.padding(.top, 50)
                
                Spacer()
            }
        }
        .onAppear(perform: startTimer)
        
    }
    
    func startTimer() {
        timerIsPaused = false
        
        year = components.year!
        month = components.month!
        day = components.day!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { tempTimer in
            
            if self.seconds == 59 {
                self.seconds = 0

                if self.minutes == 59 {
                    self.minutes = 0
                    self.hours += 1
                } else {
                    self.minutes += 1
                }
            } else {
                self.seconds += 1
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

struct QuarantineDurationView_Previews: PreviewProvider {
    static var previews: some View {
        QuarantineDurationView(date: Date())
    }
}
