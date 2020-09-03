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
        self.tabBar.invalidateIntrinsicContentSize()
        self.selectedImage(with: .blue)
        instantiateControllers()
    }
    
    func instantiateControllers() {
        let dailyController = UINavigationController(rootViewController: DailyViewController())
        dailyController.tabBarItem = UITabBarItem(title: "Daily", image: UIImage(named: "water-glass"), tag: 0)
        
//        let reportController = UINavigationController(rootViewController: ReportViewController())
//        reportController.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: "graph"), tag: 1)
        
        let controllers = [dailyController]
        viewControllers = controllers
    }
}

import UIKit

extension UITabBarController {
    func selectedImage(with color: UIColor) {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .white
        
        self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowRadius = 10
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
        
    }
}
