import UIKit

class DescriptionsView: UIStackView {
    @IBOutlet weak var titleLabel: UILabel!

    var viewModel: DetailDescriptionViewModel? {
        didSet { configure() }
    }
}

extension DescriptionsView: Configurable {
    func configure() {
        titleLabel.text = viewModel?.title
    }
}

struct DetailDescriptionViewModel {
    let title: String
}

extension DetailDescriptionViewModel {
    init(model: DetailDish?) {
        self.title = model?.description ?? ""
    }
}
