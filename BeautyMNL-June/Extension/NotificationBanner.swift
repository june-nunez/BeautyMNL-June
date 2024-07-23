//
//  NotificationBanner.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import NotificationBannerSwift

struct Notif {
    static func showTapped(_ title: String?) {
        let banner = NotificationBanner(
            title: "Tapped",
            subtitle: title,
            style: .success
        )
        banner.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            banner.dismiss()
        }
    }
}
