//
//  SongList.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 15/11/2023.
//

import SwiftUI

struct SongList: View {

    @StateObject private var viewModel = MainViewModel()
    @State private var searchBarText = ""
    private var filteredSongs: [SongModel] {
        viewModel.seachTracks(searchText: searchBarText)
    }

    var body: some View {
        /// Навигация нашего приложения, чтобы мы могли вернуться к экрану
        NavigationStack {
            /// Скролл вью, чтобы могли скролить
            ScrollView(showsIndicators: false) {
                /// То же самое, что и VStack, но он ленивый. Т.е переиспользует ячейки. Используеют, когда данных много.
                LazyVStack {
                    /// Тут перебираем наши треки. Т.к SongModel подписан на `Identifiable` мы можем по нему итерироваться.
                    ForEach(filteredSongs) { song in
                        /// Это место, куда мы будем переходить при нажатии
                        NavigationLink {
                            /// Экран, который откроем при нажатии
                            SongDetails(song: song)
                        } label: {
                            /// наша ячейка
                            MusicCell(song: song)
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal, 15)
                }
            }
            /// Фон
            .background(LinearGradient.appBackground)
            /// Наш сёрч бар выше
            .searchable(text: $searchBarText)
            /// Наш заголовок
            .navigationBarTitle("Песни")
        }
        /// Не теряем!
        .environmentObject(viewModel)
        /// Задаём тему всегда тёмную
        .colorScheme(.dark)
        /// Перед появлением экрана будем выполнять функцию fetchData
        .onAppear(perform: fetchData)
    }
}

// MARK: - Network

private extension SongList {

    func fetchData() {
        viewModel.songs = .mockData
    }
}

// MARK: - Preview

#Preview {
    SongList()
    /// Не теряем!
        .environmentObject(MainViewModel())
}
