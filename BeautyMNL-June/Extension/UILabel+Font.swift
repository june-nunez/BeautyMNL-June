//
//  UILabel+Font.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import UIKit

enum FontStyle: CGFloat {
    case header = 20
    case body = 14
    case caption1 = 12
    case caption2 = 10
}

extension UILabel {
    func applyFont(_ style: FontStyle) {
        let fontSize = style.rawValue
        
        font = .systemFont(ofSize: fontSize)
    }
    
    func setWeight(_ weight: UIFont.Weight) {
        font = .systemFont(ofSize: font.pointSize, weight: weight)
    }
}
