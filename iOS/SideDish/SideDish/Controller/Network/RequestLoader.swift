import Foundation

final class RequestLoader<T: NetworkRequest> {
    let apiRequest: T
    let urlSession: URLSession

    init(apiRequest: T, urlSession: URLSession = .shared ) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }

    func load(with requestData: T.RequestDataType?, completion: @escaping (Result<T.ResponseDataType, APIError>) -> Void) {
        let request = self.apiRequest.makeRequest(from: requestData)

        urlSession.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                return completion(.failure(.request(error)))
            }

            guard let data = data else {
                return completion(.failure(.data))
            }

            guard let model = self?.apiRequest.parseResponse(data: data) else {
                return completion(.failure(.response))
            }
            completion(.success(model))

        }.resume()
    }
}

enum APIError: Error {
    case request(Error)
    case data
    case response
}
