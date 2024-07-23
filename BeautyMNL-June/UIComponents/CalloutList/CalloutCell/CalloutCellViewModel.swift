//
//  CalloutCellViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/31/22.
//

import UIKit

protocol CalloutCellViewModel {
    var image: UIImage { get }
    var title: String { get }
    var subtitle: String { get }
    var discountPercent: String { get }
}

class FlashSaleCellViewModel {
    
    private let item: Sale
    
    init(_ item: Sale) {
        self.item = item
    }
    
}

// MARK: - CalloutCellViewModel

extension FlashSaleCellViewModel: CalloutCellViewModel {
    var image: UIImage {
        item.thumb
    }
    
    var title: String {
        item.name
    }
    
    var subtitle: String {
        "Up next"
    }
    
    var discountPercent: String {
        "%\(item.discountPercent)"
    }
}
