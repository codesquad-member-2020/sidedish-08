import UIKit

struct ImageRequest: APIRequest {
    typealias RequestDataType = URL
    typealias ResponseDataType = UIImage

    func makeRequest(from data: URL?) -> URLRequest {
        guard let url = data else {
            fatalError("Invalid URL")
        }

        return URLRequest(url: url)
    }

    func parseResponse(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}
