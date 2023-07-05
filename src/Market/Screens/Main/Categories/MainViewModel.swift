//
//  MainViewModel.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

import SwiftUI

public class MainViewModel: ObservableObject {
    @Published var response: PropertyState<MainResponce> = .none

    @MainActor
    func fetchData() {
        response = .loading

        Task {
            do {
                response = .data(try await ApiService.shared.fetchCategories())
            } catch {
                response = .error(error.localizedDescription)
            }
        }
    }
}
