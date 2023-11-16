//
//  MainViewModel.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 15/11/2023.
//

import Foundation

protocol MainViewModelProtocol {
    func seachTracks(searchText: String) -> [SongModel]
    func pressedLike(trackID: Int, isLiked: Bool, completion: (() -> Void)?)
    func getTracks(completion: @escaping (Error?) -> Void)
}

final class MainViewModel: ObservableObject {

    @Published var songs: [SongModel] = []
}

// MARK: - MainViewModelProtocol

extension MainViewModel: MainViewModelProtocol {
    
    /// Получение треков
    /// - Parameter completion: комлишн блок с ошибкой, если она есть
    func getTracks(completion: @escaping (Error?) -> Void) {
        APIManager.shared.getTracks { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                songs = data
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }

    /// Фильтрация при поиске
    /// - Parameter searchText: текст из сёрч бара
    /// - Returns: массив отфильтрованных песен
    func seachTracks(searchText: String) -> [SongModel] {
        searchText.isEmpty
        ? songs
        : songs.filter {
            ($0.title ?? "Название не указано").contains(searchText)
            || ($0.artist ?? "Исполнитель не задан").contains(searchText)
        }
    }
    
    /// Нажатие кнопки лайка у ячейки
    /// - Parameters:
    ///   - trackID: `id` нажатого трека
    ///   - isLiked: статус лайка
    func pressedLike(trackID: Int, isLiked: Bool, completion: (() -> Void)? = nil) {
        print("Вы нажали трек с id: \(trackID). Статус: \(isLiked)")

        // Дальше пишите бизнес логику ...
        
        /// Здесь мы делаем имитацию запроса в интернет, т.е задержку на 1 секунду.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion?()
        }
    }
}
