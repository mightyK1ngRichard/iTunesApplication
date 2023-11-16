//
//  APIManager.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 16/11/2023.
//

import Foundation

final class APIManager {

    private init() {}

    static let shared = APIManager()

    func getTracks(completion: @escaping (Result<[SongModel], APIError>) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=${term}&media=music&entity=song"
        guard let url = URL(string: urlString) else {
            completion(.failure(.incorrectlyURL))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(.error(error)))
                }
                return
            }
            /// Приводим `response` к типу HTTPURLResponse
            guard let response = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(.responseIsNil))
                }
                return
            }
            /// Провекра кода ответа
            guard (200..<300).contains(response.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.badStatusCode(response.statusCode)))
                }
                return
            }
            /// Распаковка дата
            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(.dataIsNil))
                }
                return
            }
            do {
                let collections = try JSONDecoder().decode(CollectionEntity.self, from: data)
                /// Т.к в коллекциях у нас лежит массив `SongEntity`, то мы перебираем массив и маппим их в `SongModel`
                DispatchQueue.main.async {
                    completion(.success(collections.results.map { $0.mapper }))
                }
                return

            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.error(error)))
                }
            }
        }.resume()
    }
}
