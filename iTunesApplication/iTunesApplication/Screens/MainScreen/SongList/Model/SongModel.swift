//
//  SongModel.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 15/11/2023.
//

import Foundation

struct SongModel: Identifiable {
    let id = UUID()
    var trackId: Int
    var title: String?
    var artist: String?
    var imageURL: URL?
    var releaseDate: String?
    var collectionPrice: String?
}

// MARK: - Mock data

extension SongModel {

    static let mockData = SongModel(
        trackId: 10023,
        title: "Back To Her Men Back To Her Men",
        artist: "Demien Rice",
        imageURL: .mockData,
        releaseDate: "20/11/2023",
        collectionPrice: "100"
    )
}

extension [SongModel] {

    static let mockData = (1...20).map {
        SongModel(
            trackId: $0,
            title: "Просто заголовок песни \($0)",
            artist: "Великий артист \($0)",
            imageURL: .mockData,
            releaseDate: "\($0)/11/2023",
            collectionPrice: $0 % 2 == 0 ? nil : "\($0)"
        )
    }
}

private extension URL {

    static let mockData = URL(string: "https://static.wixstatic.com/media/5a922b_6cd50e8a382c42bd9660cadc04bae1cd~mv2_d_2000_2000_s_2.jpg")
}
