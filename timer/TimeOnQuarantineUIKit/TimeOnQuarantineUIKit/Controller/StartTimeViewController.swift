//
//  StartTimeViewController.swift
//  TimeOnQuarantineUIKit
//
//  Created by Jessica Lewinter on 29/07/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class TimerUpdate {
    static let shared = TimerUpdate()
    
    init() {
        seconds = 0
    }
    
    var seconds: Int
}


class StartTimeViewController: UIViewController {
    
    lazy var smartTimeView: SmartTimeView = SmartTimeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quarantine Time"
        useNavigation()
    }
    
    override func loadView() {
        view = smartTimeView
    }
    
    func useNavigation() {
        smartTimeView.presentView = {[weak self] (controller) in
            guard let self = self else {return}
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
