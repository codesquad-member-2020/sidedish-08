import Foundation

struct MainWrapper: Codable {
    let statusCode: Int
    let body: [MainDish]
}

struct MainDish: Codable {
    typealias DeliveryType = SingleValue<String>
    typealias Badge = SingleValue<String>

    let detailHash: DetailHash
    let imageURL: ImageURL
    let imageText: String
    let deliveryTypes: [DeliveryType]
    let title: String
    let description: String
    let normalPrice: Price?
    let specialPrice: Price?
    let badges: [Badge]?

    enum CodingKeys: String, CodingKey {
        case detailHash = "detail_hash"
        case imageURL = "image"
        case imageText = "alt"
        case deliveryTypes = "delivery_type"
        case title
        case description
        case normalPrice = "n_price"
        case specialPrice = "s_price"
        case badges = "badge"
    }
}
