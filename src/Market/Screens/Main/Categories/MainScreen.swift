//
//  MainScreen.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

import Kingfisher
import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                NavigationBar()
                    .padding(.horizontal)
                ScrollView {
                    LazyVStack {
                        switch viewModel.response {
                        case .data(let response):
                            ForEach(response.categories ?? [], id: \.id) { item in
                                NavigationLink {
                                    FoodCatalogScreen(title: item.name ?? "n/n")
                                } label: {
                                    MainCustomCell(text: item.name ?? "n/n", image: item.imageUrl ?? "")
                                }
                            }

                        case .loading:
                            Text("Данные загружаются")

                        case .error(let error):
                            Text(error)

                        case .none:
                            Text("Нет данных")
                        }
                    }
                    .listStyle(.plain)
                    .padding(.horizontal)
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
