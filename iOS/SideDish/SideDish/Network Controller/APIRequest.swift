import Foundation

protocol APIRequest {
    associatedtype RequestDataType
    associatedtype ResponseDataType

    func makeRequest(from data: RequestDataType?) -> URLRequest
    func parseResponse(data: Data) -> ResponseDataType?
}

protocol JSONRequest: APIRequest where RequestDataType: Encodable, ResponseDataType: Decodable { }

extension JSONRequest {
    var baseURL: String {
        "http://13.125.127.249:8080/sidedish08/api"
    }

    func parseResponse(data: Data) -> ResponseDataType? {
        let object = try? JSONDecoder().decode(ResponseDataType.self, from: data)

        return object
    }
}
