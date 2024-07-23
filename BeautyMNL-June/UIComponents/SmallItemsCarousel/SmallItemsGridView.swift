//
//  SmallItemsGridView.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class SmallItemsGridView: UIView {
    
    private let items: [SmallItemViewModel]
    
    private let reuseId = "id"
    
    private let horizontalPadding: CGFloat
    
    private let layout: UICollectionViewLayout
        
    init(
        items: [SmallItemViewModel],
        horizontalPadding: CGFloat,
        layout: UICollectionViewLayout
    ) {
        self.items = items
        self.horizontalPadding = horizontalPadding
        self.layout = layout
        super.init(frame: .zero)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension SmallItemsGridView {
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SmallItemCell.self, forCellWithReuseIdentifier: reuseId)
        
        addSubview(collectionView)
        collectionView.fillSuperview(padding: .init(
            top: 0,
            left: horizontalPadding,
            bottom: 0,
            right: horizontalPadding)
        )
    }
}

// MARK: - UICollectionViewDataSource

extension SmallItemsGridView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: reuseId,
                for: indexPath
            ) as? SmallItemCell else {
            fatalError("Failed to dequeue cell")
        }
        
        cell.viewModel = items[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SmallItemsGridView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        Notif.showTapped(items[indexPath.row].title)
    }
}
