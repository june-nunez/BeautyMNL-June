//
//  UIColor.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        if let rgbValue = UInt(hexString, radix: 16) {
            let red   =  CGFloat((rgbValue >> 16) & 0xff) / 255
            let green =  CGFloat((rgbValue >>  8) & 0xff) / 255
            let blue  =  CGFloat((rgbValue      ) & 0xff) / 255
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        } else {
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }
    
    static func colorWithHexString(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        guard cString.count == 6 else {
            return .gray
        }
        
        let rString = String(cString.prefix(2))
        let gString = String(cString.dropFirst(2).prefix(2))
        let bString = String(cString.dropFirst(4).prefix(2))
        
        var r: UInt64 = 0, g: UInt64 = 0, b: UInt64 = 0
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(red: CGFloat(r) / 255.0,
                       green: CGFloat(g) / 255.0,
                       blue: CGFloat(b) / 255.0,
                       alpha: alpha)
    }
}
