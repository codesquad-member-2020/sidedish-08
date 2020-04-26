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

protocol Configurable: class {
    func configure()
}

protocol Observer: class {
    func updateChanges()
}
