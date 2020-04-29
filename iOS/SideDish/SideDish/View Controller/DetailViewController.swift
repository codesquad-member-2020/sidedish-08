import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var topImagesView: TopImagesView!
    @IBOutlet weak var descriptionsView: DescriptionsView!
    @IBOutlet weak var bottomImagesView: BottomImagesView!

    let network: NetworkController = .init()
    var detailHash: DetailHash = ""

    // MARK: - View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        network.loadDetailDish(at: detailHash, onSuccess: setupViews(dish:))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Private

    private func setupViews(dish: DetailDish?) {
        DispatchQueue.main.async {
            self.descriptionsView.setViewModel(DescriptionViewModel(model: dish))
            self.topImagesView.setViewModel(TopImagesViewModel(model: dish))
            self.bottomImagesView.setViewModel(BottomImagesViewModel(model: dish))
        }
    }
}
