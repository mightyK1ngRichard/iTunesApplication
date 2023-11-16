//
//  SongEntity.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 16/11/2023.
//

import Foundation

struct SongEntity: Decodable {
    var trackId: Int
    var collectionName: String?
    var artistName: String?
    var artworkUrl100: String?
    var releaseDate: String?
    var collectionPrice: Double?
}

// MARK: - Mapper

extension SongEntity {

    var mapper: SongModel {
        SongModel(
            trackId: trackId,
            title: collectionName,
            artist: artistName,
            imageURL: artworkUrl100?.toURL,
            releaseDate: releaseDate,
            collectionPrice: collectionPrice.toString
        )
    }
}
