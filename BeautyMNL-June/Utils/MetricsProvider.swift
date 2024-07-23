//
//  MetricsProvider.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import UIKit

struct MetricsProvider {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.width
    
    static let horizontalPadding: CGFloat = 18
    
    static let verticalPadding: CGFloat = 18
    
    static let buttonRadius: CGFloat = 10
    
    static func getSuggestedWidth(
        numberOfItemsVisible: Int,
        itemSpacing: CGFloat,
        horizontalPadding: CGFloat?
    ) -> CGFloat {
        let horizontalPadding = horizontalPadding ?? self.horizontalPadding
        
        let remainingSpace = screenWidth -
            (horizontalPadding * 2) -
            (itemSpacing * CGFloat(numberOfItemsVisible))
        
        return remainingSpace / CGFloat(numberOfItemsVisible)
    }
    
    static func getSuggestedWidthForGrid(
        itemsPerRow: Int,
        itemSpacing: CGFloat,
        horizontalPadding: CGFloat = 0
    ) -> CGFloat {
        var availableSpace = screenWidth - (CGFloat(itemsPerRow - 1) * itemSpacing)
        
        availableSpace -= horizontalPadding * 2
        
        return availableSpace / CGFloat(itemsPerRow)
    }
    
}

