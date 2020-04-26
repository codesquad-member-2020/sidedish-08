import UIKit

protocol ImagesViewModel: Observable {
    var images: [UIImage] { get set }
    var imageURLs: [ImageURL] { get }
}

extension ImagesViewModel {
    func fetchImages() {
        let network = NetworkController()

        imageURLs.forEach { url in
            network.loadImage(url: url) { [weak self] image in
                guard let image = image else { return }
                self?.images.append(image)
            }
        }
    }
}

protocol Observable: class {
    var observers: [Observer?] { get set }

    func addObserver(_ observer: Observer)
}

extension Observable {
    func addObserver(_ observer: Observer) {
        weak var observer = observer // 순환참조를 방지하기 위한 것인데, 의도대로 작동하는 지 궁금함
        observers.append(observer)
    }
}
