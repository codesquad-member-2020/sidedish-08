import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var topImagesView: TopImagesView!
    @IBOutlet weak var descriptionsView: DescriptionsView!
    @IBOutlet weak var bottomImagesView: BottomImagesView!

    let network: NetworkController = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = false
    }

    func setupViews() {
        let detailHash: DetailHash = "HBDEF"
        network.loadDetailDish(at: detailHash) { dish in
            DispatchQueue.main.async {
                self.descriptionsView.viewModel = DescriptionViewModel(model: dish)

                self.topImagesView.viewModel = TopImagesViewModel(model: dish)
                self.topImagesView.configure()

                self.bottomImagesView.viewModel = BottomImagesViewModel(model: dish)
                self.bottomImagesView.configure()
            }
        }
    }
}
