//
//  TabBar.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Asset.Icons.main.swiftUIImage
                        .renderingMode(.template)
                    Text("Главная")
                }

            SearchScreen()
                .tabItem {
                    Asset.Icons.search.swiftUIImage
                        .renderingMode(.template)
                    Text("Поиск")
                }

            CartScreen()
                .tabItem {
                    Asset.Icons.cart.swiftUIImage
                        .renderingMode(.template)
                    Text("Корзина")
                }
            AccountScreen()
                .tabItem {
                    Asset.Icons.account.swiftUIImage
                        .renderingMode(.template)
                    Text("Аккаунт")
                }
        }
        .tint(.blue)
    }
}
