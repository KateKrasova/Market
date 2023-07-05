//
//  FoodCatalogResponce.swift
//  Market
//
//  Created by Kate on 30.06.2023.
//

// swiftlint:disable all

import Foundation

// MARK: - MainResponse
public struct FoodCatalogResponce: Codable, Equatable {
    public let dishes: [Dish]?

    enum CodingKeys: String, CodingKey {
        case dishes = "dishes"
    }

    public init(dishes: [Dish]?) {
        self.dishes = dishes
    }
}

// MARK: - Dish
public struct Dish: Codable, Equatable {
    public let id: Int?
    public let name: String?
    public let price: Int?
    public let weight: Int?
    public let description: String?
    public let imageUrl: String?
    public let tegs: [Teg]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case weight = "weight"
        case description = "description"
        case imageUrl = "image_url"
        case tegs = "tegs"
    }

    public init(id: Int?, name: String?, price: Int?, weight: Int?, description: String?, imageUrl: String?, tegs: [Teg]?) {
        self.id = id
        self.name = name
        self.price = price
        self.weight = weight
        self.description = description
        self.imageUrl = imageUrl
        self.tegs = tegs
    }
}

public enum Teg: String, Codable, Equatable, CaseIterable {
    case all = "Все меню"
    case salats = "Салаты"
    case withRice = "С рисом"
    case withFish = "С рыбой"
}
