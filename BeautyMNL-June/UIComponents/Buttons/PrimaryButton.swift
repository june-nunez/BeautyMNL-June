//
//  PrimaryButton.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

struct ButtonBuilder {
    static func primaryButton(
        title: String,
        rightImage: UIImage?
    ) -> UIButton {
        let button = UIButton(title: title, titleColor: .black)
        button.backgroundColor = AppColor.lightBlue
        button.contentEdgeInsets = mediumInsets
        button.layer.cornerRadius = MetricsProvider.buttonRadius
        
        if let rightImage = rightImage {
            button.setImage(rightImage, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
        }
        
        button.tintColor = .black
        
        return button
    }
    
    static func callOutButton(
        title: String
    ) -> UIButton {
        let button = UIButton(title: title, titleColor: .white)
        button.backgroundColor = AppColor.carnationPink
        button.titleLabel?.setWeight(.bold)
        button.contentEdgeInsets = largeInsets
        button.layer.cornerRadius = MetricsProvider.buttonRadius
        
        return button
    }
}

// MARK: - Utils

extension ButtonBuilder {
    static var mediumInsets: UIEdgeInsets {
        .init(
            top: 10,
            left: 15,
            bottom: 10,
            right: 15
        )
    }
    
    static var largeInsets: UIEdgeInsets {
        .init(
            top: 13,
            left: 15,
            bottom: 13,
            right: 15
        )
    }
}
