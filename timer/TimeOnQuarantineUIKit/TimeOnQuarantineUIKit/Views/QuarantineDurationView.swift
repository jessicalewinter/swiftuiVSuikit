//
//  QuarantineDurationView.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class QuarantineDurationView: UIView {
    var date: Date?
    
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    
    var hours: Int = 0
    var minutes: Int = 0
    
    var seconds: Int = 0
    
    var timer: Timer? = nil
    
    var updateUI: (() -> Void)?
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    lazy var components: DateComponents = {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.calendar, .year, .month, .day, .hour, .minute, .second], from: date!, to: Date())
        return components
    }()
    
    lazy var titleText: UILabel = UILabel(with: "Quarantine Duration", ofType: .title1, and: .black)
    
    lazy var detailText: UILabel = UILabel(with: "Isolated since", ofSize: 25, and: .gray)
    
    lazy var detailDateText: UILabel = {
        let label = UILabel(with: "Isolated since", ofType: .body, and: .gray)
        label.text = self.dateFormatter.string(from: date!)
        return label
    }()
    
    lazy var upperStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var downStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var yearView: DateView = DateView(text: "\(self.components.year ?? 0)", detail: "yr", type: .title1)
    lazy var monthView: DateView = DateView(text: "\(self.components.month ?? 0)", detail: "mth", type: .title1)
    lazy var dayView: DateView = DateView(text: "\(self.components.day ?? 0)", detail: "days", type: .title1)
    
    lazy var hourView: DateView = DateView(text: "\(self.components.hour ?? 0)", detail: "hrs", type: .largeTitle)
    lazy var minuteView: DateView = DateView(text: "\(self.minutes)", detail: "min", type: .largeTitle)
    lazy var secondView: DateView = DateView(text: "\(self.seconds)", detail: "sec", type: .largeTitle)
    
    init(date: Date) {
        self.date = date
        super.init(frame: .zero)
        setupView()
        self.startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSeparator(type: UIFont.TextStyle) -> UILabel {
        return UILabel(with: ":", ofType: type, and: .black)
    }
    
    func startTimer() {
        
        year = components.year!
        month = components.month!
        day = components.day!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] tempTimer in
            guard let self = self else {return}
            TimerUpdate.shared.seconds = self.seconds
            self.updateUI?()
            
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

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func restartTimer() {
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
        addSubview(upperStackView)
        addSubview(downStackView)
        upperStackView.addArrangedSubview(yearView)
        upperStackView.addArrangedSubview(createSeparator(type: .title1))
        upperStackView.addArrangedSubview(monthView)
        upperStackView.addArrangedSubview(createSeparator(type: .title1))
        upperStackView.addArrangedSubview(dayView)
        downStackView.addArrangedSubview(hourView)
        downStackView.addArrangedSubview(createSeparator(type: .largeTitle))
        downStackView.addArrangedSubview(minuteView)
        downStackView.addArrangedSubview(createSeparator(type: .largeTitle))
        downStackView.addArrangedSubview(secondView)
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
        
        NSLayoutConstraint.activate([
            upperStackView.topAnchor.constraint(equalTo: detailDateText.bottomAnchor, constant: 30),
            upperStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            upperStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            downStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 30),
            downStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            downStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
