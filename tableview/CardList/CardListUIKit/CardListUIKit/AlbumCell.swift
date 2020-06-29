//
//  AlbumCell.swift
//  CardListUIKit
//
//  Created by Mateus Rodrigues on 06/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    let cardView = UIView()
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let yearLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
        
        addSubview(cardView)
        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowOpacity = 0.25
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = .zero
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cardView.widthAnchor.constraint(equalTo: cardView.heightAnchor),
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        coverImageView.layer.borderWidth = 1
        coverImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        coverImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleLabel.textColor = .systemBlue

        yearLabel.textColor = .black
        
        let stackView = UIStackView(arrangedSubviews: [coverImageView, titleLabel, yearLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 2
        
        cardView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
