//
//  QuarantineDurationView.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class QuarantineDurationView: UIView {
    
    var date: Date
    
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    var timer: Timer? = nil
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var components: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.calendar, .year, .month, .day, .hour, .minute, .second], from: date, to: Date())
        return components
    }
    
    lazy var titleText: UILabel = UILabel(with: "Quarantine Duration", ofType: .title1, and: .black)
    
    lazy var detailText: UILabel = UILabel(with: "Isolated since", ofSize: 25, and: .gray)
    
    lazy var detailDateText: UILabel = {
        let label = UILabel(with: "Isolated since", ofType: .body, and: .gray)
        label.text = self.dateFormatter.string(from: date)
        return label
    }()
    
    init(date: Date) {
        self.date = date
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startTimer() {
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
        timer?.invalidate()
        timer = nil
    }

    func restartTimer(){
        hours = 0
        minutes = 0
        seconds = 0
    }
}

extension QuarantineDurationView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(titleText)
        addSubview(detailText)
        addSubview(detailDateText)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
           titleText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
           titleText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
           titleText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
       ])
       
       NSLayoutConstraint.activate([
           detailText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 20),
           detailText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
           detailText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
       ])
        
        NSLayoutConstraint.activate([
            detailDateText.topAnchor.constraint(equalTo: detailText.bottomAnchor, constant: 10),
            detailDateText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            detailDateText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
