//
//  CollectionEntity.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 16/11/2023.
//

import Foundation

struct CollectionEntity: Decodable {
    var results: [SongEntity]
}
