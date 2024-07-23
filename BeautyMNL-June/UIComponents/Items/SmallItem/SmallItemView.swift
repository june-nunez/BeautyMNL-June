//
//  SmallItem.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class SmallItemCell: UICollectionViewCell {
    
    var viewModel: SmallItemViewModel? {
        didSet {
            setupViewModel()
        }
    }
    
    private let contentStack: UIStackView = {
        StackViewBuilder.createStackView(
            .vertical,
            alignment: .center,
            spacing: 8
        )
    }()
    
    private let circleImageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension SmallItemCell {
    private func setup() {
        setupContentView()
        setupImage()
        setupTitle()
    }
    
    private func setupContentView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentStack)
        contentStack.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor
        )
    }
    
    private func setupViewModel() {
        circleImageView.image = viewModel?.image
        titleLabel.text = viewModel?.title
    }
    
    private func setupImage() {
        circleImageView.backgroundColor = .systemRed
        circleImageView.contentMode = .scaleAspectFill
        
        let diameter = 55
        circleImageView.withSize(.init(width: diameter, height: diameter))
        circleImageView.layer.cornerRadius = CGFloat(diameter / 2)
        circleImageView.clipsToBounds = true
        
        contentStack.addArrangedSubview(circleImageView)
    }
    
    private func setupTitle() {
        titleLabel.numberOfLines = 0
        titleLabel.applyFont(.caption2)
        titleLabel.textAlignment = .center
        contentStack.addArrangedSubview(titleLabel)
    }
}
