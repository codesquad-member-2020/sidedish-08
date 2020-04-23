import Foundation

protocol NetworkRequest {
    associatedtype RequestDataType
    associatedtype ResponseDataType

    func makeRequest(from data: RequestDataType?) -> URLRequest
    func parseResponse(data: Data) -> ResponseDataType?
}

protocol APIRequest: NetworkRequest where RequestDataType: Encodable, ResponseDataType: Decodable { }

extension APIRequest {
    var baseURL: String {  "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan"
    }

    func parseResponse(data: Data) -> ResponseDataType? {
        let object = try? JSONDecoder().decode(ResponseDataType.self, from: data)

        return object
    }
}
