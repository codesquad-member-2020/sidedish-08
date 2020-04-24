import Foundation

struct DetailDishRequest: APIRequest {
    typealias RequestDataType = DetailHash
    typealias ResponseDataType = DetailDishWrapper

    let pathURL = "detail"

    func makeRequest(from data: RequestDataType?) -> URLRequest {
        let string = [baseURL, pathURL, (data ?? "")].joined(separator: "/")
        let url = URL(string: string)!

        return URLRequest(url: url)
    }
}
