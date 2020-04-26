import UIKit

class DetailTopImagesViewModel {
    var images: [UIImage] = .init() {
        didSet { observer?.updateChanges() }
    }

    let topImageURL: ImageURL?
    var thumbImagesURL: [ImageURL?]

    weak var observer: ObservableView?

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
                self?.appendImage(image)
            }
        }
    }

    private func appendImage(_ image: UIImage?) {
        guard let image = image else { return }
        self.images.append(image)
    }
}
