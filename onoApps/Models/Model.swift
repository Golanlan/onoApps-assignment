//
//  Model.swift
//  onoApps
//
//  Created by Golan Shoval Gil on 10/03/2022.
//

import Foundation

// MARK: - MainModel
struct MainModel: Codable {
    let fruits: [Fruit]?
    let err: Int?
}

// MARK: - Fruit
struct Fruit: Codable {
    let name: String?
    let image: String?
    let fruitDescription: String?
    let price: Int?

    enum CodingKeys: String, CodingKey {
        case name, image
        case fruitDescription = "description"
        case price
    }
}
