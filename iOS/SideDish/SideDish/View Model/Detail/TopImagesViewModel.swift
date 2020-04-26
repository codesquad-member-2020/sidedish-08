import UIKit

class TopImagesViewModel: ImagesViewModel {
    private(set) var images: [UIImage] = [] {
        didSet {
            observers?.forEach { $0.updateChanges() }
        }
    }

    let topImageURL: ImageURL?
    var thumbImagesURL: [ImageURL?]

    var observers: [ObservableView]? = []

    init(model: DetailDish?) {
        self.topImageURL = model?.topImage
        self.thumbImagesURL = model?.thumbImages ?? []
        self.fetchImage()
    }

    func fetchImage() {
        let network = NetworkController()
        let urls = ([topImageURL] + thumbImagesURL).compactMap { $0 }

        urls.forEach { url in
            network.loadImage(url: url) { [weak self] image in
                guard let image = image else { return }
                self?.images.append(image)
            }
        }
    }

    func addObserver(_ observer: ObservableView) {
        observers?.append(observer)
    }

}

protocol ImagesViewModel: class {
    var images: [UIImage] { get }
    var observers: [ObservableView]? { get set }

    func addObserver(_ observer: ObservableView)
}
