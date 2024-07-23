//
//  MediumItemCellViewModel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

protocol MediumItemCellViewModel {
    var thumb: UIImage? { get }
    var thumbCaption: String? { get }
    var slug: String { get }
    var title: String { get }
    var price: NSAttributedString? { get }
    var ratings: Int { get }
    var votesCount: Int { get }
    var isOnSale: Bool { get }
}
