//
//  TabBarController.swift
//  WaterReminderUIKit
//
//  Created by Jessica Lewinter on 19/08/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instantiateControllers()
    }
    
    func instantiateControllers() {
        let dailyController = UINavigationController(rootViewController: DailyViewController())
        dailyController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let reportController = UINavigationController(rootViewController: ReportViewController())
        reportController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let controllers = [dailyController, reportController]
        viewControllers = controllers
    }
}
