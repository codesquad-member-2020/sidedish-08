import UIKit

class ItemCellViewModel {
    var image: UIImage? = nil

    var imageURL: ImageURL {
        didSet { fetchImage() }
    }
    let title: String
    let description: String
    let normalPrice: String
    let salePrice: String
    let badges: [Badge]

    init(model: BriefDish) {
        self.imageURL = model.imageURL
        self.title = model.title
        self.description = model.description
        self.normalPrice = "\(model.normalPrice) 원"
        self.salePrice = "\(model.salePrice) 원"
        self.badges = model.badges
    }
}

extension ItemCellViewModel {
    func fetchImage() {
        let network = NetworkController()

        network.loadImage(url: self.imageURL) { [weak self] image in
            guard let image = image else { return }
            self?.image = image
        }
    }
}
