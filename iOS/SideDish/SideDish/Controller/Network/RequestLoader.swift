import Foundation

final class RequestLoader<T: NetworkRequest> {
    let networkRequest: T
    let urlSession: URLSession

    init(apiRequest: T, urlSession: URLSession = .shared ) {
        self.networkRequest = apiRequest
        self.urlSession = urlSession
    }

    func load(with requestData: T.RequestDataType?, completion: @escaping (Result<T.ResponseDataType, APIError>) -> Void) {
        let request = self.networkRequest.makeRequest(from: requestData)

        urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                return completion(.failure(.request(error)))
            }

            guard let data = data else {
                return completion(.failure(.data))
            }

            guard let model = self.networkRequest.parseResponse(data: data) else {
                return completion(.failure(.response(response)))
            }
            completion(.success(model))

        }.resume()
    }
}

enum APIError: Error {
    case request(Error)
    case data
    case response(URLResponse?)
}
