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
    var currentDate: Date!
    
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
    
    lazy var stopAction: UIButton = {
        let button = UIButton(with: "Stop! Finally found vaccine", and: .orange)
        button.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        return button
    }()
    
    init(date: Date) {
        self.date = date
        super.init(frame: .zero)
        setupView()
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
        
        self.updateUI?()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSelec), userInfo: nil, repeats: true)
    }
    
    @objc func timerSelec() {
        self.update()

        currentDate = Date(timeInterval: TimeInterval.init(exactly: -2)!, since: Date())
        let diffDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate, to: date!)

        self.year = abs(diffDateComponents.year!)
        self.month = abs(diffDateComponents.month!)
        self.day = abs(diffDateComponents.day!)
        self.hours = abs(diffDateComponents.hour!)
        self.minutes = abs(diffDateComponents.minute!)
        self.seconds = abs(diffDateComponents.second!)
        
    }

    @objc func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func restartTimer() {
        hours = 0
        minutes = 0
        seconds = 0
    }
    
    func update() {
        self.secondView.dateText.text = "\(self.seconds)"
        self.minuteView.dateText.text = "\(self.minutes)"
        self.hourView.dateText.text = "\(self.hours)"
        
        self.dayView.dateText.text = "\(self.day)"
        self.monthView.dateText.text = "\(self.month)"
        self.yearView.dateText.text = "\(self.year)"
    }

}

extension QuarantineDurationView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(titleText)
        addSubview(detailText)
        addSubview(detailDateText)
        addSubview(upperStackView)
        addSubview(downStackView)
        addSubview(stopAction)
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
        
        NSLayoutConstraint.activate([
            stopAction.topAnchor.constraint(equalTo: downStackView.bottomAnchor, constant: 20),
            stopAction.centerXAnchor.constraint(equalTo: centerXAnchor),
            stopAction.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            stopAction.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
