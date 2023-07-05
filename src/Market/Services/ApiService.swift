//
//  ApiService.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

import Alamofire

public struct ApiService {
    public static let shared = ApiService()

    private init() {
    }
}

// MARK: - Public Methods

public extension ApiService {
    func fetchCategories() async throws -> MainResponce {
        try await AF.request("https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")
            .serializingDecodable(MainResponce.self)
            .value
    }

    func fetchFoodCatalog() async throws -> FoodCatalogResponce {
        try await AF.request("https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")
            .serializingDecodable(FoodCatalogResponce.self)
            .value
    }
}
