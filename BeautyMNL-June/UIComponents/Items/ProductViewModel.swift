//
//  ItemViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import Foundation
import UIKit

class ProductViewModel {
    
    private let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
}

// MARK: - MediumItemCellViewModel

extension ProductViewModel: MediumItemCellViewModel {
    var title: String {
        product.name
    }
    
    var thumb: UIImage? {
        product.thumb
    }
    
    var thumbCaption: String? {
        "Limited time 26% off"
    }
    
    var slug: String {
        product.slug
    }
    
    var price: NSAttributedString? {
        let originalPrice: Double = product.price
        let discountedPrice: Double = product.price - product.discount
        
        guard let formattedOriginalPrice = getFormattedPrice(price: originalPrice) else {
            return nil
        }
        
        var discountedAttributed: NSMutableAttributedString?
        
        if let formattedDiscountedPrice = getFormattedPrice(price: discountedPrice) {
            let discountAttrs = [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: FontStyle.body.rawValue),
                NSAttributedString.Key.foregroundColor : AppColor.lightGray
            ]
            discountedAttributed = NSMutableAttributedString(
                string: formattedDiscountedPrice,
                attributes: discountAttrs
            )
            discountedAttributed?.addAttribute(
                NSAttributedString.Key.strikethroughStyle,
                value: 1,
                range: NSRange(location: 0, length: discountedAttributed?.length ?? 0)
            )
        }
        
        let originalAttrs = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: FontStyle.body.rawValue),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        let originalAttributed = NSMutableAttributedString(
            string: formattedOriginalPrice + " ",
            attributes: originalAttrs
        )
        
        if let discountedAttributed = discountedAttributed {
            originalAttributed.append(discountedAttributed)
        }
        
        return originalAttributed
    }
    
    var ratings: Int {
        product.rating
    }
    
    var votesCount: Int {
        product.voteCount
    }
    
    var isOnSale: Bool {
        product.isOnSale
    }
}

// MARK: - Utils

extension ProductViewModel {
    private func getFormattedPrice(price: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: price as NSNumber)
    }
}
