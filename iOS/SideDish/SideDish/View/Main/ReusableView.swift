import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

// MARK: -

protocol Configurable: class {
    associatedtype ViewModelType

    var viewModel: ViewModelType { get set }

    func setup()
    func configure()
    func setViewModel(_ viewModel: ViewModelType)
}

extension Configurable {
    func setViewModel(_ viewModel: ViewModelType) {
        self.viewModel = viewModel
        setup()
    }
}

// MARK: -

protocol Observer: class {
    func updateChanges()
}

// MARK: -

extension UILabel {
    func setStrikethrough() {
        guard let string = self.text else { return }

        let attributeString: NSMutableAttributedString = .init(string: string)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: .init(location: 0, length: string.count))
        self.attributedText = attributeString
    }
}
