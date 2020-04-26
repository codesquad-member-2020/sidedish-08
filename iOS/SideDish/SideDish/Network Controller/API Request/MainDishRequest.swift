import Foundation

struct MainDishRequest: JSONRequest {
    typealias RequestDataType = MainDishWrapper
    typealias ResponseDataType = MainDishWrapper

    let pathURL = "main"

    func makeRequest(from data: RequestDataType?) -> URLRequest {
        let string = [baseURL, pathURL].joined(separator: "/")
        let url = URL(string: string)!

        return URLRequest(url: url)
    }
}
