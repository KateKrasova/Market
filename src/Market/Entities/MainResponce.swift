//
//  MainResponce.swift
//  Market
//
//  Created by Kate on 29.06.2023.
//

// swiftlint:disable all

import Foundation

// MARK: - MainResponse

public struct MainResponce: Codable, Equatable {
    public let categories: [Category]?

    enum CodingKeys: String, CodingKey {
        case categories = "сategories"
    }

    public init(categories: [Category]?) {
        self.categories = categories
    }
}

// MARK: - Сategory

public struct Category: Codable, Equatable {
    public let id: Int?
    public let name: String?
    public let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageUrl = "image_url"
    }

    public init(id: Int?, name: String?, imageUrl: String?) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
}
