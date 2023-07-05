//
//  FoodCatalogViewModel.swift
//  Market
//
//  Created by Kate on 30.06.2023.
//

import SwiftUI

public class FoodCatalogViewModel: ObservableObject {
    @Published var response: PropertyState<FoodCatalogResponce> = .none

    @MainActor
    func fetchData() {
        response = .loading

        Task {
            do {
                response = .data(try await ApiService.shared.fetchFoodCatalog())
            } catch {
                response = .error(error.localizedDescription)
            }
        }
    }
}
