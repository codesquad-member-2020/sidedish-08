import UIKit

class ImagesStackView: UIStackView {
    
}

class DetailTopImagesView: UIStackView {
    @IBOutlet weak var scrollViewLayoutGuide: UILayoutGuide!

    var viewModel: DetailTopImagesViewModel? {
        didSet {
            configure()
        }
    }
}

extension DetailTopImagesView: Configurable {
    func configure() {
        viewModel?.observer = self
        resetSubviews()
    }
}

extension DetailTopImagesView: ObservableView {
    func updateChanges() {
        DispatchQueue.main.async {
            self.resetSubviews()
            self.viewModel?.images.forEach { image in
                self.addImageViews(image: image)
            }
        }
    }

    private func resetSubviews() {
        if arrangedSubviews.isEmpty { return }

        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    private func addImageViews(image: UIImage) {
        let view = makeImageView(image: image)
        addArrangedSubview(view)
        adjust(subView: view)
    }

    private func makeImageView(image: UIImage?) -> UIImageView {
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill

        return view
    }

    private func adjust(subView view: UIImageView) {
        let width = self.scrollViewLayoutGuide.widthAnchor
        view.widthAnchor.constraint(equalTo: width).isActive = true
    }
}
