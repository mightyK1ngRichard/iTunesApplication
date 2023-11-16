//
//  Double+Extenstions.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 16/11/2023.
//

import Foundation

extension Double? {

    var toString: String? {
        guard let self else { return nil }
        return "\(self)"
    }
}
