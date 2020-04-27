import Foundation

struct MainDish: Codable {
    typealias Money = String
    typealias DeliveryType = SingleValue<String>
    typealias Badge = SingleValue<String>

    let detailHash: String
    let imageURL: URL
    let imageText: String
    let deliveryTypes: [DeliveryType]
    let title: String
    let description: String
    let normalPrice: Money?
    let specialPrice: Money?
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

struct MainWrapper: Codable {
    let statusCode: Int
    let body: [MainDish]
}

struct SingleValue<T>: Codable where T: Codable {
    var value: T

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value = try container.decode(T.self)
    }
}
