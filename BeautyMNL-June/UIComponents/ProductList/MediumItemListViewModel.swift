//
//  MediumItemListViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/31/22.
//

import Foundation

protocol MediumItemListViewModel {
    var title: String { get }
    var subtitle: String? { get }
    var buttonTitle: String { get }
    var items: [MediumItemCellViewModel] { get }
}

class ProductListViewModel {
    
    let category: Category
    let products: [Product]
    
    init(
        _ category: Category,
        _ products: [Product]
    ) {
        self.category = category
        self.products = products
    }
}

extension ProductListViewModel: MediumItemListViewModel {
    var title: String {
        category.name
    }
    
    var subtitle: String? {
        category.parent
    }
    
    var buttonTitle: String {
        "See All".uppercased()
    }
    
    var items: [MediumItemCellViewModel] {
        products.map({ ProductViewModel($0) })
    }
}
