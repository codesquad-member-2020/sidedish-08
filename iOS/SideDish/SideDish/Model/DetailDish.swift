import UIKit

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

    // Top Images
    let topImage: ImageURL
    let thumbImages: [ImageURL]
//    var images: [UIImage] = .init()

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

//    enum CodingKeys: String, CodingKey {
//        case hash
//
//        // Top Images
//        case topImage
//        case thumbImages
//
//        // Descriptions
//        case description
//        case normalPrice
//        case salePrice
//        case point
//        case deliveryInfo
//        case deliveryFee
//        case badges
//
//        // Detail Images
//        case detailImages
//    }
}
