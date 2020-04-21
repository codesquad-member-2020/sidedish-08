import Foundation

protocol APIRequest {
    associatedtype RequestDataType: Encodable
    associatedtype ResponseDataType: Decodable

    func makeRequest(from data: RequestDataType) -> URLRequest
    func parseResponse(data: Data) -> ResponseDataType?
}
