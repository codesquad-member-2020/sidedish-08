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
    func setup()
    func configure()
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
