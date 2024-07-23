//
//  MediumBannerView.swift
//  BeautyMnl-Mac-Noble
//
//  Created by Mac Romel D. Noble on 7/30/22.
//

import UIKit

class MediumBannerView: UIView {
    
    private let banner: UIImage
    
    init(banner: UIImage) {
        self.banner = banner
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension  MediumBannerView {
    private func setup() {
        let constraint = heightAnchor.constraint(equalToConstant: 150)
        constraint.isActive = true
        constraint.priority = .defaultHigh
        
        let imageView = UIImageView(image: banner)
        imageView.contentMode = .scaleAspectFill
        
        addSubview(imageView)
        imageView.fillSuperview()
        imageView.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(tapHandler)
        )
        addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func tapHandler() {
        Notif.showTapped("Medium banner")
    }
}
