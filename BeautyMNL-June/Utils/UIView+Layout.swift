//
//  UIView+Layout.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import LBTATools

extension UIView {
    func fillXSuperview() {
        guard let superview = superview else { return }
        
        anchor(
            .leading(superview.leadingAnchor),
            .trailing(superview.trailingAnchor)
        )
    }
    
    func fillYSuperview() {
        guard let superview = superview else { return }
        
        anchor(
            .top(superview.topAnchor),
            .bottom(superview.bottomAnchor)
        )
    }
}
