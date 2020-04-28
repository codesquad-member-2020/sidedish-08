import Foundation

protocol DishListRequest: JSONRequest {
    var pathURL: String { get }

    func makeRequest(from data: RequestDataType?) -> URLRequest
}

extension DishListRequest {
    func makeRequest(from data: RequestDataType?) -> URLRequest {
        let string = [baseURL, pathURL].joined(separator: "/")
        let url = URL(string: string)!

        return URLRequest(url: url)
    }
}

struct MainDishRequest: DishListRequest {
    typealias RequestDataType = BriefDishWrapper
    typealias ResponseDataType = BriefDishWrapper

    let pathURL = "main"
}

struct SoupDishRequest: DishListRequest {
    typealias RequestDataType = BriefDishWrapper
    typealias ResponseDataType = BriefDishWrapper

    let pathURL = "soup"
}

struct SideDishRequest: DishListRequest {
    typealias RequestDataType = BriefDishWrapper
    typealias ResponseDataType = BriefDishWrapper

    let pathURL = "side"
}

