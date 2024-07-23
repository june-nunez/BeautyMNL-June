//
//  CalloutCell.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/31/22.
//

import UIKit

class CalloutCell: UICollectionViewCell {
    
    var viewModel: CalloutCellViewModel? {
        didSet {
            setupViewModel()
        }
    }
    
    private let mainStack = StackViewBuilder.createStackView(
        .vertical,
        spacing: 0
    )
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let thumbImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

private extension CalloutCell {
    func setup() {
        contentView.backgroundColor = AppColor.almostWhite
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        setupMainStack()
        setupThumbImageView()
        setupLabels()
    }
    
    func setupMainStack() {
        contentView.addSubview(mainStack)
        mainStack.fillSuperview()
    }
    
    func setupLabels() {
        titleLabel.applyFont(.body)
        titleLabel.textColor = AppColor.carnationPink
        subtitleLabel.applyFont(.caption1)
        
        let labelStack = StackViewBuilder.createStackView(
            .vertical,
            alignment: .center,
            spacing: 5,
            arrangedSubviews: [titleLabel, subtitleLabel, UIView()]
        )
        
        let labelWrapper = UIView()
        labelWrapper.addSubview(labelStack)
        labelWrapper.withHeight(55)
        labelStack.fillSuperview(padding: .allSides(8))
        
        mainStack.addArrangedSubview(labelWrapper)
    }
    
    func setupThumbImageView() {
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.clipsToBounds = true
        mainStack.addArrangedSubview(thumbImageView)
    }
    
    func setupViewModel() {
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
        thumbImageView.image = viewModel?.image
    }
}
