//
//  QuarantineDurationViewController.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class QuarantineDurationViewController: UIViewController {
    var quarantineView: QuarantineDurationView
    
    init(quarantineView: QuarantineDurationView) {
        self.quarantineView = quarantineView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.quarantineView.updateUI = {
            self.loadView()
            self.quarantineView.secondView.text = "\(TimerUpdate.shared.seconds)"
        }
    }

    
    override func loadView() {
        view = quarantineView
    }
    
    @objc func updateText(notification: NSNotification) {
        quarantineView.secondView.text += "\(1)"
    }
}
