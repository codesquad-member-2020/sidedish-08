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
    func configure() {
        titleLabel.text = viewModel?.title
        subTitleLabel.text = viewModel?.description
        normalPriceLabel.text = viewModel?.normalPrice
        salePriceLabel.text = viewModel?.salePrice

        normalPriceLabel.setStrikethrough()
    }
}
