//
//  PlaygroundView.swift
//  iTunesApplication
//
//  Created by Dmitriy Permyakov on 07/12/2023.
//

import SwiftUI

struct PlaygroundView: View {
    private let image = URL(string: "https://i7.photo.2gis.com/images/branch/0/30258560052749393_b802.jpg")
    @State private var counter = 0

    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.title2)

            AsyncImage(url: image) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipped()

            } placeholder: {
                Text("Loading...")
            }

            Text("""
            Московский государственный технический университет им. Н.Э. Баумана — российский национальный исследовательский университет, научный центр и особо ценный объект культурного наследия народов России.

            Индикатор успеха — формирование в массовом сознании в России и за рубежом понятия или образа «русский инженер».
            """)
            .padding(.horizontal, 20)

            Button {
                counter += 1

            } label: {
                Text("Поступить на IU5")
                /// Делаем отступ по горизонтали
                    .padding(.horizontal, 50)
                /// Делаем отстпу по вертикали
                    .padding(.vertical, 12)
                /// Задаём фон кнопки
                    .background(.pink)
                /// Делаем фона углы 16 градосов
                    .clipShape(.rect(cornerRadius: 16))
                /// Делаем цвет текста белым
                    .foregroundStyle(.white)
                /// Задаём стили текста
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
            }
            /// Делаем отступ кнопки от текст выше
            .padding(.top, 20)
        }
    }
}

#Preview {
    PlaygroundView()
}
