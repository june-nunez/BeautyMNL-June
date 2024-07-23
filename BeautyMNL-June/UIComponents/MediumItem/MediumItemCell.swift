//
//  MediumItemCell.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class MediumItemCell: UICollectionViewCell {
    
    var viewModel: MediumItemCellViewModel? {
        didSet {
            setupViewModel()
        }
    }
    
    // MARK: - Private properties
    
    private let thumbnailImageView = UIImageView()
    private let thumbCaptionLabel = UILabel()
    private let slugLabel = UILabel()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private var ratingView: UIView?
    private var labelStack: UIStackView?
    
    private let mainStackView: UIStackView = {
        StackViewBuilder.createStackView(
            .vertical,
            alignment: .fill,
            distribution: .fill,
            spacing: 0
        )
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension MediumItemCell {
    private func setup() {
        contentView.backgroundColor = AppColor.almostWhite
        
        setupMainStackView()
        setupThumbnail()
        setupLabels()
    }
    
    private func setupMainStackView() {
        contentView.addSubview(mainStackView)
        mainStackView.fillSuperview()
    }
    
    private func setupThumbnail() {
        mainStackView.addArrangedSubview(thumbnailImageView)
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView
            .setContentCompressionResistancePriority(
                .defaultLow,
                for: .vertical
            )
    }
    
    private func setupLabels() {
        titleLabel.numberOfLines = 2
        titleLabel.applyFont(.body)
        titleLabel.minimumScaleFactor = 0.7
        
        slugLabel.applyFont(.body)
        slugLabel.textColor = AppColor.carnationPink
        
        let titleStack = StackViewBuilder.createStackView(
            .vertical,
            alignment: .leading,
            spacing: 0,
            arrangedSubviews: [titleLabel, UIView()]
        )
        titleStack.withHeight(36)
        
        let labelStack = StackViewBuilder.createStackView(
            .vertical,
            alignment: .leading,
            distribution: .fill,
            spacing: 5,
            arrangedSubviews: [
                slugLabel,
                titleStack,
                priceLabel
            ]
        )
        
        let labelWrapper = UIView()
        labelWrapper.addSubview(labelStack)
        labelStack.fillSuperview(
            padding: .allSides(10)
        )
        
        self.labelStack = labelStack
        
        mainStackView.addArrangedSubview(labelWrapper)
    }
    
    private func setupRatings() {
        ratingView?.removeFromSuperview()
        
        guard let viewModel = viewModel else { return }
        
        ratingView = RatingView(
            ratings: viewModel.ratings,
            votesCount: viewModel.votesCount
        )
        
        if let ratingView = ratingView {
            labelStack?.addArrangedSubview(ratingView)
        }
    }
    
    private func setupViewModel() {
        guard let viewModel = viewModel else { return }
        thumbnailImageView.image = viewModel.thumb
        slugLabel.text = viewModel.slug
        titleLabel.text = viewModel.title
        priceLabel.attributedText = viewModel.price
        setupRatings()
    }
}
