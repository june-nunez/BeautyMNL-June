//
//  HorizontalCollectionView.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class HorizontalCollectionView: UIView {
    
    var collectionView: UICollectionView?
    
    private let numberOfItemsVisible: Int
    
    private let itemSpacing: CGFloat
    
    private let aspectRatio: CGFloat
    
    private var itemWidth: CGFloat {
        MetricsProvider.getSuggestedWidth(
            numberOfItemsVisible: numberOfItemsVisible,
            itemSpacing: itemSpacing,
            horizontalPadding: MetricsProvider.horizontalPadding
        )
    }
    
    private var itemHeight: CGFloat {
        itemWidth * aspectRatio
    }
    
    private var layout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = itemSpacing
        
        return layout
    }
        
    init(
        numberOfItemsVisible: Int,
        itemSpacing: CGFloat = 5,
        aspectRatio: CGFloat = 1.44
    ) {
        self.numberOfItemsVisible = numberOfItemsVisible
        self.itemSpacing = itemSpacing
        self.aspectRatio = aspectRatio
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension HorizontalCollectionView {
    private func setup() {
        let heightConstraint = heightAnchor.constraint(equalToConstant: itemHeight)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultHigh
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        
        collectionView?.showsHorizontalScrollIndicator = false
        
        if let collectionView = collectionView {
            addSubview(collectionView)
        }
        collectionView?.fillSuperview()
        
        collectionView?.contentInset = .init(
            top: 0,
            left: MetricsProvider.horizontalPadding,
            bottom: 0,
            right: 0
        )
    }
    
}
