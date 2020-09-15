//
//  DefaultViewController.swift
//  WaterReminderUIKit
//
//  Created by Jessica Lewinter on 19/08/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // Do any additional setup after loading the view.
    }

}
