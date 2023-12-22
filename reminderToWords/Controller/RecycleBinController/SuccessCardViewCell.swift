//
//  RecycleBinCollectionCell.swift
//  reminderToWords
//
//  Created by Ahmet Göktürk Kurt on 20.12.2023.
//

import UIKit

class SuccessCardViewCell : UICollectionViewCell {
    
    let word = UIComponentsHelper.createCustomLabel(text: "", size: 25, labelBackGroundColor: UIColor.clear, textColor: UIColor.white, fontName: "Poppins-SemiBold")
    let wordMean = UIComponentsHelper.createCustomLabel(text: "", size: 25, labelBackGroundColor: UIColor.clear, textColor: UIColor.white, fontName: "Poppins-SemiBold")
    let wordDescription = UIComponentsHelper.createCustomLabel(text: "", size: 20, labelBackGroundColor: UIColor.clear, textColor: UIColor.white, fontName: "Poppins-SemiBold")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(_ frontName: String, _ backName :String,_ cardDescription:String) {
        word.text = frontName
        wordMean.text = backName
        wordDescription.text = cardDescription
    }
    
    private func setupViewCell() {
        addSubview(wordMean)
        addSubview(wordDescription)
        addSubview(word)
        
        wordMean.anchor(top: topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0, centerXAnchor: centerXAnchor, centerYAnchor: nil)
        
        wordDescription.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 15, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0, centerXAnchor: centerXAnchor, centerYAnchor: nil)
        
        word.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0, centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)
        
  
        wordDescription.numberOfLines = 2
        wordDescription.textAlignment = .center
        
        word.numberOfLines = 2
        word.textAlignment = .center
        
        wordMean.numberOfLines = 2
        wordMean.textAlignment = .center
    }
}