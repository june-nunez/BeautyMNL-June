//
//  MediumItemList.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class MediumItemList: UIView {
    
    private let viewModel: MediumItemListViewModel
    
    private let reuseId = "id"
    
    private let mainStackView = StackViewBuilder.createStackView(
        .vertical,
        spacing: 12
    )
    
    init(_ viewModel: MediumItemListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension MediumItemList {
    private func setup() {
        backgroundColor = .white
        setupHeader()
        setupMainStackView()
        setupCollectionView()
    }
    
    private func setupMainStackView() {
        addSubview(mainStackView)
        mainStackView.fillSuperview(
            padding: .init(
                top: MetricsProvider.verticalPadding,
                left: 0,
                bottom: MetricsProvider.verticalPadding,
                right: 0
            )
        )
    }
    
    private func setupCollectionView() {
        let horizontalCollectionView = HorizontalCollectionView(
            numberOfItemsVisible: 2
        )
        
        horizontalCollectionView.collectionView?.dataSource = self
        horizontalCollectionView.collectionView?.delegate = self
        horizontalCollectionView
            .collectionView?
            .register(
                MediumItemCell.self,
                forCellWithReuseIdentifier: reuseId
            )
        
        mainStackView.addArrangedSubview(horizontalCollectionView)
    }
    
    private func setupHeader() {
        let headerLabel = UILabel(text: viewModel.title)
        headerLabel.applyFont(.header)
        
        let headerLabelsStack = StackViewBuilder.createStackView(
            .vertical,
            alignment: .leading,
            spacing: 2,
            arrangedSubviews: [headerLabel]
        )
        
        if let subtitle = viewModel.subtitle {
            headerLabelsStack.addArrangedSubview(
                createSubtitleLabel(subtitle)
            )
        }
        
        let primaryButton = ButtonBuilder.primaryButton(
            title: viewModel.buttonTitle,
            rightImage: UIImage(systemName: "arrow.right")
        )
        primaryButton.addAction(.init(handler: { [weak self] _ in
            Notif.showTapped(self?.viewModel.buttonTitle)
        }), for: .touchUpInside)
        
        let headerStack = StackViewBuilder.createStackView(
            .horizontal,
            alignment: .center,
            distribution: .equalSpacing,
            arrangedSubviews: [headerLabelsStack, primaryButton]
        )
        
        let headerWrapper = UIView()
        headerWrapper.addSubview(headerStack)
        headerStack.fillSuperview(padding: .init(
            top: 0,
            left: MetricsProvider.horizontalPadding,
            bottom: 0,
            right: MetricsProvider.horizontalPadding
        ))
        
        mainStackView.addArrangedSubview(headerWrapper)
    }
    
    private func createSubtitleLabel(_ text: String) -> UIView {
        let diamond = UIImageView(image: .goldDiamond)
        diamond.withSize(.init(width: 7, height: 7))
        diamond.contentMode = .scaleAspectFit
        
        let subtitleLabel = UILabel(text: text)
        subtitleLabel.applyFont(.body)
        subtitleLabel.textColor = AppColor.gold
        
        let subtitleStack = StackViewBuilder.createStackView(
            .horizontal,
            alignment: .center,
            spacing: 5,
            arrangedSubviews: [diamond, subtitleLabel]
        )
        
        return subtitleStack
    }
}

// MARK: - UICollectionViewDataSource

extension MediumItemList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath
        ) as? MediumItemCell else {
            fatalError("Failed to dequeue cell!")
        }
        
        cell.viewModel = self.viewModel.items[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension MediumItemList: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        Notif.showTapped(viewModel.items[indexPath.row].title)
    }
}
