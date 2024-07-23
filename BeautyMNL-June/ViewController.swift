//
//  ViewController.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import UIKit

class ViewController: UITableViewController {
    
    private var views: [UIView] {
        [
            bannerCarousel,
            categoriesCarousel,
            flashSaleList,
            producList1,
            productList2,
            mediumBanner,
            productList3,
            productList4
        ]
    }
    
    private let bannerCarousel: UIView = {
        Carousel(
            MockProvider.getBanners().map({ image in
                let imageView = UIImageView(image: image)
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFill
                return imageView
            }),
            bannerHeight: MetricsProvider.screenWidth * 0.6,
            slideDuration: 3,
            isPageTappable: true
        )
    }()
    
    private let producList1: UIView = {
        MediumItemList(
            ProductListViewModel(
                .init(name: "Cleansers & Toners", parent: "in Skincare", thumb: .cat1),
                MockProvider.getRandomProducts(12)
            )
        )
    }()
    
    private let productList2: UIView = {
        MediumItemList(
            ProductListViewModel(
                .init(name: "Serums & Treatments", parent: "in Health", thumb: .cat1),
                MockProvider.getRandomProducts(20)
            )
        )
    }()
    
    private let productList3: UIView = {
        MediumItemList(
            ProductListViewModel(
                .init(name: "Health Supplements", parent: nil, thumb: .cat1),
                MockProvider.getRandomProducts(14)
            )
        )
    }()
    
    private let productList4: UIView = {
        MediumItemList(
            ProductListViewModel(
                .init(name: "Vitamins", parent: nil, thumb: .cat1),
                MockProvider.getRandomProducts(5)
            )
        )
    }()
    
    private let mediumBanner: UIView = {
        MediumBannerView(banner: .smallbanner)
    }()
    
    private let categoriesCarousel: UIView = {
        SmallItemsCarousel(
            MockProvider
                .getRandomCategories(30)
                .map({ CategoryViewModel($0) })
        )
    }()
    
    private let flashSaleList: UIView = {
        CalloutList(
            FlashSaleViewModel(MockProvider.getSales())
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        navigationController?.isNavigationBarHidden = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        views.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        
        let view = views[indexPath.row]
        
        cell.contentView.addSubview(view)
        view.fillSuperview()
        
        return cell
    }
}
