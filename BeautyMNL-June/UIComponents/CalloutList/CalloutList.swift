//
//  FlashSaleListView.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/31/22.
//

import UIKit

class CalloutList: UIView {
    
    private let viewModel: CalloutListViewModel
    
    private let reuseId = "id"
    
    private let mainStackView = StackViewBuilder.createStackView(
        .vertical,
        spacing: 12
    )
    
    init(_ viewModel: CalloutListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension CalloutList {
    private func setup() {
        backgroundColor = AppColor.peach
        setupMainStackView()
        setupCollectionView()
        addTopRightLogo()
        setupCalloutButton()
    }
    
    private func setupCalloutButton() {
        let calloutButton = ButtonBuilder.callOutButton(title: viewModel.buttonTitle)
        
        calloutButton.addAction(.init(handler: { [weak self] _ in
            Notif.showTapped(self?.viewModel.buttonTitle)
        }), for: .touchUpInside)
        
        let buttonWrapper = UIView()
        buttonWrapper.addSubview(calloutButton)
        calloutButton.fillSuperview(padding: .init(
            top: 0,
            left: MetricsProvider.horizontalPadding,
            bottom: 0,
            right: MetricsProvider.horizontalPadding
        ))
        
        mainStackView.addArrangedSubview(buttonWrapper)
        
    }
    
    private func addTopRightLogo() {
        guard let calloutImage = viewModel.image else { return }
        let imageView = UIImageView(image: calloutImage)
        
        imageView.withSize(.init(width: 200, height: 50))
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        imageView.anchor(
            .bottom(mainStackView.topAnchor, constant: -8),
            .leading(mainStackView.leadingAnchor, constant: -10)
        )
    }
    
    private func setupMainStackView() {
        addSubview(mainStackView)
        mainStackView.fillSuperview(
            padding: .init(
                top: MetricsProvider.verticalPadding + 40,
                left: 0,
                bottom: MetricsProvider.verticalPadding + 15,
                right: 0
            )
        )
    }
    
    private func setupCollectionView() {
        let horizontalCollectionView = HorizontalCollectionView(
            numberOfItemsVisible: 3,
            aspectRatio: 1.45
        )
        
        horizontalCollectionView.collectionView?.dataSource = self
        horizontalCollectionView.collectionView?.delegate = self
        horizontalCollectionView
            .collectionView?
            .register(
                CalloutCell.self,
                forCellWithReuseIdentifier: reuseId
            )
        
        mainStackView.addArrangedSubview(horizontalCollectionView)
        horizontalCollectionView.collectionView?.backgroundColor = .clear
    }
}

// MARK: - UICollectionViewDataSource

extension CalloutList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseId,
            for: indexPath
        ) as? CalloutCell else {
            fatalError("Failed to dequeue cell!")
        }
        
        cell.viewModel = self.viewModel.items[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CalloutList: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        Notif.showTapped(viewModel.items[indexPath.row].title)
    }
}
