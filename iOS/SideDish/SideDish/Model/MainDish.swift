import Foundation

// API path: sidedish08/api/main

struct MainDishWrapper: Codable {
    let message: String
    let contents: Contents

    struct Contents: Codable {
        let data: [MainDish]
    }
}

struct MainDish {
    typealias DeliveryType = SingleValue<String>

    let hash: DetailHash
    let imageURL: ImageURL
    let imageText: String
    let deliveryTypes: [DeliveryType]
    let title: String
    let description: String
    let normalPrice: Price
    let salePrice: Price
    let badges: [Badge]
}

extension MainDish: Codable {
    enum CodingKeys: String, CodingKey {
        case hash
        case imageURL = "image"
        case imageText = "alt"
        case deliveryTypes = "deliveryType"
        case title
        case description
        case normalPrice
        case salePrice
        case badges = "badge"
    }
}
