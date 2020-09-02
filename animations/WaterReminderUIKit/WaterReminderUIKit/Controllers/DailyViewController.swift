//
//  DailyViewController.swift
//  WaterReminderUIKit
//
//  Created by Jessica Lewinter on 19/08/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class DailyViewController: DefaultViewController {
    
    let shapeLayer = CAShapeLayer()
    let dailyWaterRecommended: CGFloat = 2000
    var initialDailyWater: CGFloat = 0
    var percentage: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Daily"
        createShapeLayer()
        createView()
    }
    
    func createView() {
        let waterView = AddWaterView()
        waterView.translatesAutoresizingMaskIntoConstraints = false
        waterView.backgroundColor = .mainBlue
        let tap = UITapGestureRecognizer(target: self, action: #selector(addWater))
        waterView.addGestureRecognizer(tap)
        view.addSubview(waterView)
        NSLayoutConstraint.activate([
            waterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            waterView.widthAnchor.constraint(equalToConstant: 100),
            waterView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func createShapeLayer() {
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = .round
        trackLayer.strokeEnd = 1
        view.layer.addSublayer(trackLayer)

        let percentageCircularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = percentageCircularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
    }
    
    private func animateCircle() {
        let oldPercentage = percentage
        initialDailyWater += 200
        
        percentage = initialDailyWater / dailyWaterRecommended
//        shapeLayer.strokeStart = oldPercentage
        shapeLayer.strokeEnd = percentage
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = percentage
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = true
        
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
    private func beginDownloadFile() {
        print("Attempting to downlaod file")
    }
    
    @objc private func addWater() {
        print("Attempting to animate view")
        beginDownloadFile()
        animateCircle()
    }
    
}

