//
//  SmallItemCarousel.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class SmallItemsCarousel: UIView {
    
    var items: [SmallItemViewModel] = []
    
    init(
        _ items: [SmallItemViewModel]
    ) {
        self.items = items
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension SmallItemsCarousel {
    private func setup() {
        backgroundColor = .white
        let gridSpacing: CGFloat = 7
        let grids = createSmallItemsGrid(spacing: gridSpacing)
        
        let itemSize = calculateSuggestedWidthForItem(spacing: gridSpacing)
        let gridHeight = (itemSize.height * 2) + gridSpacing
        
        let carousel = Carousel(grids, bannerHeight: gridHeight)
        
        addSubview(carousel)
        carousel.fillSuperview(padding: .init(
            top: 15,
            left: 0,
            bottom: 15,
            right: 0
        ))
    }
}

// MARK: - Grid setup

private extension SmallItemsCarousel {
    private func createSmallItemsGrid(spacing: CGFloat) -> [UIView] {
        /// Divides all items into groups of 10
        let chunked = items.chunked(into: 10)
        
        return chunked.map { smallItemViewModels in
            SmallItemsGridView(
                items: smallItemViewModels,
                horizontalPadding: spacing,
                layout: createLayout(spacing: spacing)
            )
        }
    }
    
    private func createLayout(spacing: CGFloat) -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = calculateSuggestedWidthForItem(spacing: spacing)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        return layout
    }
    
    private func calculateSuggestedWidthForItem(
        spacing: CGFloat
    ) -> CGSize {
        let suggestedWidth = MetricsProvider.getSuggestedWidthForGrid(
            itemsPerRow: 5,
            itemSpacing: spacing,
            horizontalPadding: spacing
        )
        
        return .init(width: suggestedWidth, height: suggestedWidth * 1.48)
    }
}
