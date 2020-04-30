import Foundation
import UIKit

typealias OnFailure = (Error) -> Void

class NetworkController {
    func loadDishList<T>(with request: T, onFailure: OnFailure? = nil, onSuccess: @escaping (T.ResponseDataType) -> Void) where T: DishListRequest {
        let loader = RequestLoader(networkRequest: request)
        loader.execute(with: nil, onFailure: onFailure, onSuccess: onSuccess)
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
