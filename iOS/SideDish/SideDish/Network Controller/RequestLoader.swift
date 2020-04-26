import Foundation

final class RequestLoader<T: APIRequest> {
    typealias Handler = (Result<T.ResponseDataType, APIError>) -> Void

    let networkRequest: T
    let urlSession: URLSession

    init(networkRequest: T, urlSession: URLSession = .shared ) {
        self.networkRequest = networkRequest
        self.urlSession = urlSession
    }

    func execute(with requestData: T.RequestDataType?, onFailure: ((APIError) -> Void)?, onSuccess: @escaping (T.ResponseDataType) -> Void) {
        request(with: requestData) { result in
            switch result {
            case .success(let data):
                debugPrint(data)
                onSuccess(data)
            case .failure(let error):
                debugPrint(error)
                if let onFailure = onFailure {
                    onFailure(error)
                }
            }
        }
    }
}

private extension RequestLoader {
    func request(with requestData: T.RequestDataType?, completion: @escaping Handler) {
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
