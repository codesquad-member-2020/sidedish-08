import UIKit

class TopImagesViewModel: ImagesViewModel {
    var images: [UIImage] = [] {
        didSet { observers.forEach {
            $0?.updateChanges()
            }
        }
    }

    var imageURLs: [ImageURL] = [] {
        didSet { fetchImages() }
    }

    var observers: [Observer?] = []

    init(model: DetailDish?) {
        self.imageURLs = ([model?.topImage] + (model?.thumbImages ?? [])).compactMap { $0 }
        fetchImages()
    }
}
