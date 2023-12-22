//
//  DeckCellCollectionViewCell.swift
//  reminderToWords
//
//  Created by Ahmet Göktürk Kurt on 25.10.2023.
//

import UIKit
import SwipeCellKit

class DeckCellCollectionViewCell: SwipeCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-SemiBold", size: 25)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    
    func configure(text: String) {
        label.text = text
        label.textAlignment = .center
        
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
