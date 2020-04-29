import UIKit

final class ItemCell: UITableViewCell {
    @IBOutlet weak var ThumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var normalPriceLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!

    var viewModel: ItemCellViewModel? {
        didSet { configure() }
    }
}

extension ItemCell: Configurable {
    func setup() {
        viewModel?.addObserver(self)
    }

    func configure() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.viewModel?.title
            self.subTitleLabel.text = self.viewModel?.description
            self.normalPriceLabel.text = self.viewModel?.normalPrice
            self.salePriceLabel.text = self.viewModel?.salePrice
            self.ThumbImageView.image = self.viewModel?.image

            self.normalPriceLabel.setStrikethrough()
        }
    }
}

extension ItemCell: Observer {
    func updateChanges() {
        configure()
    }
}
