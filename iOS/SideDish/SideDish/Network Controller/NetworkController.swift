import Foundation
import UIKit

typealias OnFailure = (Error) -> Void

class NetworkController {
    func loadMainDish(onFailure: OnFailure? = nil, onSuccess: @escaping ([MainDish]) -> Void) {
        let loader = RequestLoader(networkRequest: MainDishRequest())
        loader.execute(with: nil, onFailure: onFailure, onSuccess: { result in
            let mainDishes = result.contents.data
            onSuccess(mainDishes)
        })
    }

    func loadDetailDish(at detailHash: DetailHash, onFailure: OnFailure? = nil, onSuccess: @escaping (DetailDish?) -> Void) {
        let loader = RequestLoader(networkRequest: DetailDishRequest())
        loader.execute(with: detailHash, onFailure: onFailure, onSuccess: { result in
            onSuccess(result.contents.data)
        })
    }

    func loadImage(url: URL, onFailure: OnFailure? = nil, onSuccess: @escaping (UIImage?) -> Void) {
        let loader = RequestLoader(networkRequest: ImageRequest())
        loader.execute(with: url, onFailure: onFailure, onSuccess: onSuccess)
    }
}

// MARK: - 사용하지 않음

// NetworkController를 개별 클래스로 분리하고 추상화하고 싶었지만 실패.
protocol Fetcher {
    associatedtype T
    associatedtype U

    func fetch(with requestData: T?, onFailure: OnFailure?, onSuccess: @escaping (U) -> Void)
}

class MainDishFetcher: Fetcher {
    typealias T = MainDishRequest.RequestDataType
    typealias U = MainDishRequest.ResponseDataType

    let loader = RequestLoader(networkRequest: MainDishRequest())

    func fetch(with requestData: T?, onFailure: OnFailure?, onSuccess: @escaping (U) -> Void) {
        loader.execute(with: requestData, onFailure: onFailure, onSuccess: onSuccess)
    }
}

class DetailDishFetcher: Fetcher {
    typealias T = DetailDishRequest.RequestDataType
    typealias U = DetailDishRequest.ResponseDataType

    let loader = RequestLoader(networkRequest: DetailDishRequest())

    func fetch(with requestData: T?, onFailure: OnFailure?, onSuccess: @escaping (U) -> Void) {
        loader.execute(with: requestData, onFailure: onFailure, onSuccess: onSuccess)
    }
}

class ImageFetcher: Fetcher {
    typealias T = ImageRequest.RequestDataType
    typealias U = ImageRequest.ResponseDataType

    let loader = RequestLoader(networkRequest: ImageRequest())

    func fetch(with requestData: T?, onFailure: OnFailure?, onSuccess: @escaping (U) -> Void) {
        loader.execute(with: requestData, onFailure: onFailure, onSuccess: onSuccess)
    }
}
