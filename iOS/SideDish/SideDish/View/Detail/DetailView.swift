import UIKit

class DetailView: UIStackView {
    @IBOutlet weak var topImageView: DetailTopImagesView!
    // descriptions
    // detailImages: [UIImageView]
}

extension DetailView: Configurable {
    func configure() {

    }
}

struct DetailViewModel {
}
