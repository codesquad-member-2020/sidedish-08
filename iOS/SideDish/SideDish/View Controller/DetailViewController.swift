import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var topImagesView: TopImagesView!
    @IBOutlet weak var descriptionsView: DescriptionsView!
    @IBOutlet weak var bottomImagesView: BottomImagesView!

    let network: NetworkController = .init()
    let detailHash: DetailHash = "HBDEF"

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
            self.descriptionsView.viewModel = DescriptionViewModel(model: dish)
            self.descriptionsView.setup()

            self.topImagesView.viewModel = TopImagesViewModel(model: dish)
            self.topImagesView.setup()

            self.bottomImagesView.viewModel = BottomImagesViewModel(model: dish)
            self.bottomImagesView.setup()
        }
    }
}
