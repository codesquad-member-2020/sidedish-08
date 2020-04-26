import UIKit

final class ItemCell: UITableViewCell, Configurable {
    @IBOutlet weak var ThumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var normalPriceLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!

    var viewModel: ItemCellViewModel? {
        didSet { configure() }
    }

    func configure() {
        titleLabel.text = viewModel?.title
        subTitleLabel.text = viewModel?.description
        normalPriceLabel.text = viewModel?.normalPrice
        salePriceLabel.text = viewModel?.salePrice
    }
}