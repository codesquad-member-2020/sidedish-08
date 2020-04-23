import Foundation

struct MainDishRequest: APIRequest {
    typealias RequestDataType = MainWrapper
    typealias ResponseDataType = MainWrapper

    let baseURL = "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan/"

    func makeRequest(from data: RequestDataType?) -> URLRequest {
        let url = URL(string: baseURL + "main")!

        return URLRequest(url: url)
    }

    func parseResponse(data: Data) -> ResponseDataType? {
        let object = try? JSONDecoder().decode(ResponseDataType.self, from: data)

        return object
    }
}
