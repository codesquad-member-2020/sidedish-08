import Foundation

struct MainDishRequest: APIRequest {
    typealias RequestDataType = MainWrapper
    typealias ResponseDataType = MainWrapper

    let pathURL = "main"

    func makeRequest(from data: RequestDataType?) -> URLRequest {
        let string = [baseURL, pathURL].joined(separator: "/")
        let url = URL(string: string)!

        return URLRequest(url: url)
    }
}
