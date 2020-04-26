import UIKit

class BottomImagesViewModel: ImagesViewModel {
    var images: [UIImage] = [] {
        didSet { observers?.forEach { $0.updateChanges() } }
    }

    var imageURLs: [ImageURL] = [] {
        didSet { fetchImages() }
    }

    var observers: [Observer]? = []

    init(model: DetailDish?) {
        self.imageURLs = model?.detailImages ?? []
        fetchImages()
    }
}
