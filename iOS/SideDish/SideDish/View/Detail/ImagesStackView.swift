import UIKit

class ImagesStackView: UIStackView {
    var viewModel: ImagesViewModel?

    func adjust(subView view: UIImageView) {
        // Do nothing
    }
}

private extension ImagesStackView {
    func resetSubviews() {
        if arrangedSubviews.isEmpty { return }
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    func addImageView(image: UIImage) {
        let view = makeImageView(image: image)
        addArrangedSubview(view)
        adjust(subView: view)
    }

    func makeImageView(image: UIImage?) -> UIImageView {
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill

        return view
    }
}

extension ImagesStackView: Configurable {
    func configure() {
        viewModel?.addObserver(self)
        resetSubviews()
    }
}

extension ImagesStackView: Observer {
    final func updateChanges() {
        DispatchQueue.main.async {
            self.resetSubviews()
            self.viewModel?.images.forEach { image in
                self.addImageView(image: image)
            }
        }
    }
}

// MARK: - Subclasses

class TopImagesView: ImagesStackView {
    @IBOutlet weak var rootViewSafeArea: UILayoutGuide!

    override func adjust(subView view: UIImageView) {
        let width = rootViewSafeArea.widthAnchor
        view.widthAnchor.constraint(equalTo: width).isActive = true
    }
}

class BottomImagesView: ImagesStackView {
    override func adjust(subView view: UIImageView) {
        let width = safeAreaLayoutGuide.widthAnchor
        view.widthAnchor.constraint(equalTo: width).isActive = true

        if let size = view.image?.size {
            let multiplier = size.width / size.height
            view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
        }
    }
}
