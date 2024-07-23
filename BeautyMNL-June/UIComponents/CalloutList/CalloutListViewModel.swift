//
//  CallOutListViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/31/22.
//

import UIKit

protocol CalloutListViewModel {
    var image: UIImage? { get }
    var buttonTitle: String { get }
    var items: [CalloutCellViewModel] { get }
}

class FlashSaleViewModel {
    
    private let sales: [Sale]
    
    init(_ sales: [Sale]) {
        self.sales = sales
    }
    
}

// MARK: - Flash

extension FlashSaleViewModel: CalloutListViewModel {
    var image: UIImage? {
        .flashLogo
    }
    
    var buttonTitle: String {
        "See all flash sales".uppercased()
    }
    
    var items: [CalloutCellViewModel] {
        sales.map({ FlashSaleCellViewModel($0) })
    }
}
