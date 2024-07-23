//
//  Array.swift
//  BeautyMNL-June
//
//  Created by June Noble Nuñez on 7/23/24.
//  Copyright (c) 2020 OWNER. All rights reserved.
//


import UIKit

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
