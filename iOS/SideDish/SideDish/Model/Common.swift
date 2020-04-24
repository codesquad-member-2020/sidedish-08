import Foundation

typealias ImageURL = URL
typealias Price = Int
typealias Badge = SingleValue<String>

struct SingleValue<T>: Codable where T: Codable {
    var value: T

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value = try container.decode(T.self)
    }
}
