//
//  StoreModel.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

struct FakeStoreModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    var category: Category
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case description = "description"
        case category, image, rating
    }
}

enum Category: String, Codable, CaseIterable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
    }

struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias FakeStore = [FakeStoreModel]
