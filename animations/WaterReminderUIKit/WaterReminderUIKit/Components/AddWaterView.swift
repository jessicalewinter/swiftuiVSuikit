//
//  AddWaterView.swift
//  WaterReminderUIKit
//
//  Created by Jessica Lewinter on 02/09/20.
//  Copyright © 2020 Jessica Lewinter. All rights reserved.
//

import UIKit

class AddWaterView: UIView {
    
    lazy var waterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "addWater")
        return imageView
    }()
    
    lazy var waterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "200ml"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width/2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addViews()
        setupConstraints()
    }
    
    func addViews() {
        addSubview(waterImageView)
        addSubview(waterLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            waterImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            waterImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            waterLabel.topAnchor.constraint(equalTo: waterImageView.bottomAnchor, constant: 10),
            waterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
