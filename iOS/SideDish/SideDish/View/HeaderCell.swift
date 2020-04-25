import UIKit

final class HeaderCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    var viewModel: HeaderCellViewModel? {
        didSet { configure() }
    }
}

extension HeaderCell: Configurable {
    func configure() {
        titleLabel.text = viewModel?.title
        subTitleLabel.text = viewModel?.subTitle
    }
}
