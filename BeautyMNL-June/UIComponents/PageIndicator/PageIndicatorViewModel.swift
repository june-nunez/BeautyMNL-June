//
//  PageIndicatorViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import Foundation

protocol PageIndicating {
    var pageCount: Int { get }
    var onChangePage: ((Int) -> Void)? { get set }
    var currentPage: Int { get }
}

class PageIndicatorViewModel: PageIndicating {
    let pageCount: Int
    var onChangePage: ((Int) -> Void)?
    
    var currentPage: Int {
        didSet {
            onChangePage?(currentPage)
        }
    }
    
    init(
        pageCount: Int,
        currentPage: Int = 0
    ) {
        self.pageCount = pageCount
        self.currentPage = currentPage
    }
}
