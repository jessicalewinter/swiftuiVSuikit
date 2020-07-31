//
//  QuarantineDurationViewController.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class QuarantineDurationViewController: UIViewController {
    var date: Date
    
    lazy var quarantineDurationView: QuarantineDurationView = QuarantineDurationView(date: date)
    
    init(date: Date) {
        self.date = date
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "hello"
    }
    
    override func loadView() {
        view = quarantineDurationView
    }
}