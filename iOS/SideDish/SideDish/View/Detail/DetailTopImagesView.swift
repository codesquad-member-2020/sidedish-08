import UIKit

class DetailTopImagesView: UIStackView {
    var viewModel: [UIImage]?
}

extension DetailTopImagesView: Configurable {
    func configure() {
        self.resetSubviews()

        viewModel?.forEach {
            addArrangedSubview(UIImageView(image: $0))
        }
    }

    private func resetSubviews() {
        if self.arrangedSubviews.isEmpty { return }

        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
