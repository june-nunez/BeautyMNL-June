//
//  MockProvider.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import UIKit

struct MockProvider {
    
    static func getRandomProducts(_ count: Int) -> [Product] {
        var products: [Product] = []
        (0 ..< count).forEach { _ in
            products.append(getRandomProduct())
        }
        
        return products
    }
    
    static func getRandomProduct() -> Product {
        
        let price = Double.random(in: 100...8000)
        
        return Product(
            name: MockData.productNames.randomElement() ?? "We Gloss",
            slug: MockData.slugs.randomElement() ?? "Becca",
            price: price,
            discount: Double.random(in: 0...price - 100),
            isOnSale: Bool.random(),
            thumb: (MockData.productThumbs.randomElement() ?? AppImage.diamond)!,
            rating: Int.random(in: 0...5),
            voteCount: Int.random(in: 0...500)
        )
    }
    
    static func getRandomCategories(_ count: Int) -> [Category] {
        var categories: [Category] = []
        
        (0 ..< count).forEach { _ in
            categories.append(
                Category(
                    name: MockData.categoryNames.randomElement() ?? "Base Makeup",
                    parent: nil,
                    thumb: (MockData.categoryThumbs.randomElement() ?? AppImage.cat1)!
                )
            )
        }
        
        return categories
    }
    
    static func getBanners() -> [UIImage?] {
        MockData.banners
    }
    
    static func getSales() -> [Sale] {
        [
            .init(name: "BLK Cosmetics", discountPercent: 50, thumb: .sale1),
            .init(name: "ROM&ND", discountPercent: 30, thumb: .sale2),
            .init(name: "Max Factor", discountPercent: 49, thumb: .sale3),
            .init(name: "Innisfree", discountPercent: 20, thumb: .sale4),
            .init(name: "Nuxe Paris", discountPercent: 10, thumb: .sale5)
        ]
    }
}

private struct MockData {
    static let productNames = [
        "Apple Cider Vinegar (60 Gummies)",
        "Niacinamide 10%",
        "Mattemoiselle Plush Matte Lipstick",
        "Everlasting Liquid Lipstick",
        "Dear Darling Water Gel Tint",
        "Powder Rouge Tint",
        "We Gloss",
        "Crystal Crème Shimmer Lip Crayon",
        "Pearl Glow Lip Tint"
    ]
    
    static let slugs = [
        "Bite Beauty",
        "Becca",
        "Etude House",
        "Fenty",
        "Kat Von",
        "Kimchi Chic Beauty",
        "Belo",
        "Missha",
    ]
    
    static let categoryNames: [String] = [
        "Flash Sale",
        "Buy 1, Take 1",
        "50% Off & Up",
        "P150 & Below",
        "Payday Treats",
        "Lip Bestsellers",
        "Lipsticks & Tints",
        "Lip Glosses",
        "Tinted Lip Balms",
        "Lip Treatments",
        "Lip Makeup",
        "Bundled Deals",
        "Everyday Essentials",
        "Bestsellers",
        "New Arrivals",
        "Base Makeup",
        "Eye Makeup"
    ]
    
    static let productThumbs: [UIImage?] = [
        AppImage.prod1,
        AppImage.prod2,
        AppImage.prod3,
        AppImage.prod4,
        AppImage.prod5,
        AppImage.prod6,
        AppImage.prod7,
        AppImage.prod9,
        AppImage.prod10,
        AppImage.prod11,
        AppImage.prod12,
        AppImage.prod13,
        AppImage.prod14,
        AppImage.prod15
    ]
    
    static let categoryThumbs: [UIImage?] = [
        AppImage.cat1,
        AppImage.cat2,
        AppImage.cat3,
        AppImage.cat4,
        AppImage.cat5,
        AppImage.cat6,
        AppImage.cat7,
        AppImage.cat8,
        AppImage.cat9,
        AppImage.cat10,
        AppImage.cat11,
        AppImage.cat12,
        AppImage.cat13,
        AppImage.cat14,
        AppImage.cat15,
        AppImage.cat16,
        AppImage.cat17
    ]
    
    static let banners: [UIImage?] = [
        AppImage.banner1,
        AppImage.banner2,
        AppImage.banner3,
        AppImage.banner4,
        AppImage.banner5
    ]
    
    static let flashSaleThumbs: [UIImage?] = [
        AppImage.sale1,
        AppImage.sale2,
        AppImage.sale3,
        AppImage.sale4,
        AppImage.sale5
    ]
}

