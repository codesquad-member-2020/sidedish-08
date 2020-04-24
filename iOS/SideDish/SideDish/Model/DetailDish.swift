import Foundation

struct DetailDishWrapper: Codable {
    let hash: DetailHash
    let data: DetailDish
}

typealias DetailHash = String

struct DetailDish: Codable {

    let topImage: ImageURL
    let thumbImages: [ImageURL]
    let productDescription: String
    let point: String
    let deliveryInfo: String
    let deliveryFee: String
    let prices: [Price]
    let detailSection: [ImageURL]

    enum CodingKeys: String, CodingKey {
        case topImage = "top_image"
        case thumbImages = "thumb_images"
        case productDescription = "product_description"
        case point
        case deliveryInfo = "delivery_info"
        case deliveryFee = "delivery_fee"
        case prices
        case detailSection = "detail_section"
    }
}
