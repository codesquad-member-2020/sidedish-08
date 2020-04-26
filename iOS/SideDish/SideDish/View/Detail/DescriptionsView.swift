import UIKit

class DescriptionsView: UIStackView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var normalPriceLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var deliveryInfoLabel: UILabel!

    var viewModel: DescriptionViewModel? {
        didSet { configure() }
    }
}

extension DescriptionsView: Configurable {
    func configure() {
        titleLabel.text = viewModel?.title
        subTitleLabel.text = viewModel?.subTitle
        normalPriceLabel.text = viewModel?.normalPrice
        salePriceLabel.text = viewModel?.salePrice
        pointLabel.text = viewModel?.point
        deliveryFeeLabel.text = viewModel?.deliveryFee
        deliveryInfoLabel.text = viewModel?.deliveryInfo

        normalPriceLabel.setStrikethrough()
    }
}

