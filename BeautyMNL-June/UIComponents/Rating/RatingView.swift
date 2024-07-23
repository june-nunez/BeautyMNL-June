//
//  RatingView.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class RatingView: UIView {
    
    /// A rating from 0 to 5.
    /// Probably would need a viewModel to calculate this but this will do for now :)
    let ratings: Int
    
    let votesCount: Int
    
    private let mainStack = StackViewBuilder.createStackView(
        .horizontal,
        alignment: .center,
        spacing: 6
    )
    
    private enum DiamondType {
        case solid
        case outline
    }
    
    // MARK: - Init
    init(
        ratings: Int,
        votesCount: Int
    ) {
        self.ratings = ratings
        self.votesCount = votesCount
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension RatingView {
    private func setup() {
        addSubview(mainStack)
        mainStack.fillSuperview()
        mainStack.withHeight(20)
        
        setupDiamonds()
        setupVotes()
    }
    
    private func setupDiamonds() {
        let diamondsStack = StackViewBuilder.createStackView(
            .horizontal,
            spacing: 5,
            arrangedSubviews: createDiamonds()
        )
        
        mainStack.addArrangedSubview(diamondsStack)
    }
    
    private func setupVotes() {
        let votesLabel = UILabel()
        votesLabel.text = String(votesCount)
        votesLabel.applyFont(.caption1)
        mainStack.addArrangedSubview(votesLabel)
    }
    
    private func createDiamonds() -> [UIView] {
        var diamonds: [UIView] = []
        for _ in 0 ..< ratings {
            diamonds.append(createDiamond(.solid))
        }
        
        for _ in ratings ..< 5 {
            diamonds.append(createDiamond(.outline))
        }
        
        return diamonds
    }
    
    private func createDiamond(_ diamondType: DiamondType) -> UIView {
        let diamondView = UIImageView(image: AppImage.diamond)
        
        switch diamondType {
        case .solid:
            diamondView.image = AppImage.goldDiamond
        case .outline:
            diamondView.image = AppImage.goldDiamondOutline
        }
        
        diamondView.withSize(.init(width: 10, height: 10))
        diamondView.contentMode = .scaleAspectFit
        
        return diamondView
    }
}
