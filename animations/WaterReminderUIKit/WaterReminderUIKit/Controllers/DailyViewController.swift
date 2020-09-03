//
//  DailyViewController.swift
//  WaterReminderUIKit
//
//  Created by Jessica Lewinter on 19/08/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class DailyViewController: DefaultViewController {
    let dailyWaterRecommended: CGFloat = 2000
    var initialDailyWater: CGFloat = 0
    var percentage: CGFloat = 0
    
    let shapeLayer = CAShapeLayer()
    var pulsatingLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationObservers()
        createShapeLayer()
        setupViews()
        view.backgroundColor = .white
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterBackground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func handleEnterBackground() {
        animatePulsatingLayer()
    }
    
    lazy var recommendedDailyWater: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your daily amount of water is \(Int(dailyWaterRecommended))ml"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .backgroundColor
        return label
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        label.textColor = .backgroundColor
        return label
    }()
    
    lazy var waterView: AddWaterView = {
        let view = AddWaterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(addWater))
        view.backgroundColor = .mainBlue
        view.addGestureRecognizer(tap)
        return view
    }()
    
    func setupViews() {
        addViews()
        setupConstraints()
    }
    
    func addViews() {
        view.addSubview(recommendedDailyWater)
        view.addSubview(percentageLabel)
        view.addSubview(waterView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            recommendedDailyWater.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recommendedDailyWater.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            recommendedDailyWater.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            percentageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            waterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            waterView.widthAnchor.constraint(equalToConstant: 100),
            waterView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func createShapeLayer() {
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        pulsatingLayer = CAShapeLayer()
        pulsatingLayer.path = circularPath.cgPath
        pulsatingLayer.strokeColor = UIColor.clear.cgColor
        pulsatingLayer.fillColor = UIColor.pulsatingFillColor.cgColor
        pulsatingLayer.lineWidth = 10
        pulsatingLayer.lineCap = .round
        pulsatingLayer.strokeEnd = 1
        pulsatingLayer.position = center
        view.layer.addSublayer(pulsatingLayer)
        
        let trackLayer = CAShapeLayer()
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.mainBlue.cgColor
        trackLayer.fillColor = UIColor.white.cgColor
        trackLayer.lineWidth = 20
        trackLayer.lineCap = .round
        trackLayer.strokeEnd = 1
        trackLayer.position = center
        view.layer.addSublayer(trackLayer)
        
        
        animatePulsatingLayer()
        
        let percentageCircularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 3 / 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = percentageCircularPath.cgPath
        shapeLayer.strokeColor = UIColor.outlineStrokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
    }
    
    private func animateCircle() {
        initialDailyWater += 200

        percentage = initialDailyWater / dailyWaterRecommended
        shapeLayer.strokeEnd = percentage
        print(percentage)
        
        UIView.animate(withDuration: 1) {
            self.percentageLabel.text = "\(Int(self.percentage * 100))%"
        }
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = percentage
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = true
        
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
    
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.toValue = 1.3
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.autoreverses = true
        animation.repeatCount = .infinity
        
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
    
    
    @objc private func addWater() {
        print("Attempting to animate view")
        animateCircle()
    }
    
}

