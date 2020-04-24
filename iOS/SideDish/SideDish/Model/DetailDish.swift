import Foundation

typealias DetailHash = String

struct DetailDishWrapper: Codable {
    let message: String
    let contents: Contents

    struct Contents: Codable {
        let data: DetailDish
    }
}

struct DetailDish: Codable {
    let hash: DetailHash
    let topImage: ImageURL
    let thumbImages: [ImageURL]
    let detailImages: [ImageURL]
    let normalPrice: Price
    let salePrice: Price
    let description: String
    let point: Int
    let deliveryInfo: String
    let deliveryFee: String
    let badges: [Badge]
}
