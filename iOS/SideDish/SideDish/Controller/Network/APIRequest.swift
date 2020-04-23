import Foundation

protocol APIRequest {
    associatedtype RequestDataType: Encodable
    associatedtype ResponseDataType: Decodable

    func makeRequest(from data: RequestDataType?) -> URLRequest
    func parseResponse(data: Data) -> ResponseDataType?
}

extension APIRequest {
    var baseURL: String {  "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan"
    }
}
