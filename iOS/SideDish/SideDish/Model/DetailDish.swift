import UIKit

typealias DetailHash = String

struct DetailDishWrapper: Codable, Wrapper {
    let message: String
    let contents: Contents

    struct Contents: Codable {
        let data: DetailDish
    }

    func unwrapped() -> DetailDish {
        return contents.data
    }
}

struct DetailDish: Codable {
    let hash: DetailHash

    // Top Images
    let topImage: ImageURL
    let thumbImages: [ImageURL]

    // Descriptions
    let description: String
    let normalPrice: Price
    let salePrice: Price
    let point: Int
    let deliveryInfo: String
    let deliveryFee: String
    let badges: [Badge]

    // Detail Images
    let detailImages: [ImageURL]
}
