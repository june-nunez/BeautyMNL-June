//
//  SmallItemViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

protocol SmallItemViewModel {
    var title: String { get }
    var image: UIImage { get }
}

class CategoryViewModel {
    
    private let category: Category
    
    init(_ category: Category) {
        self.category = category
    }
    
}

// MARK: - SmallItemViewModel

extension CategoryViewModel: SmallItemViewModel {
    var title: String {
        category.name
    }
    
    var image: UIImage {
        category.thumb
    }
}
