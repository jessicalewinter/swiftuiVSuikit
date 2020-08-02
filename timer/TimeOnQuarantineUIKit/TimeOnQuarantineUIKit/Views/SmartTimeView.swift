//
//  SmartTimeView.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class SmartTimeView: UIView {
    
    var date: Date?
    
    var presentView: ((UIViewController) -> Void)?
    
    lazy var titleText: UILabel = UILabel(with: "Start date of your isolation", ofType: .title1, and: .black)
    
    lazy var detailText: UILabel = UILabel(with: "...with no friends, no drinking, no games", ofType: .body, and: .gray)
    
    lazy var startDate: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(handleDate), for: .valueChanged)
        return datePicker
    }()
    
    lazy var buttonAction: UIButton = {
        let button = UIButton(with: "NEXT", and: .orange)
        button.addTarget(self, action: #selector(goToCounter), for: .touchUpInside)
        return button
    }()
    
    @objc func handleDate() {
        self.date = startDate.date
    }
    
    @objc func goToCounter() {
        setupController()
    }
    
    func setupController() {
        let view = QuarantineDurationView(date: self.date!)
        
        let quarantineDurationController = QuarantineDurationViewController(quarantineView: view)
        presentView?(quarantineDurationController)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        date = startDate.date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SmartTimeView: ViewCodable {
    func buildViewHierarchy() {
        addSubview(titleText)
        addSubview(detailText)
        addSubview(startDate)
        addSubview(buttonAction)
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
            startDate.topAnchor.constraint(equalTo: detailText.bottomAnchor, constant: 20),
            startDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            buttonAction.topAnchor.constraint(equalTo: startDate.bottomAnchor, constant: 20),
            buttonAction.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonAction.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            buttonAction.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
    
    
}
