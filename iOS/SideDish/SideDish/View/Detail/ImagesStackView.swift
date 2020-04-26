import UIKit

class ImagesStackView: UIStackView, Configurable, Observer {
    var viewModel: ImagesViewModel?

    func configure() {
        viewModel?.addObserver(self)
        resetSubviews()
    }

    final func updateChanges() {
        DispatchQueue.main.async {
            self.resetSubviews()
            self.viewModel?.images.forEach { image in
                self.addImageView(image: image)
            }
        }
    }

    private func resetSubviews() {
        if arrangedSubviews.isEmpty { return }
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    private func addImageView(image: UIImage) {
        let view = makeImageView(image: image)
        addArrangedSubview(view)
        adjust(subView: view)
    }

    private func makeImageView(image: UIImage?) -> UIImageView {
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFill

        return view
    }

    func adjust(subView view: UIImageView) {
        // Do nothing
    }
}

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
