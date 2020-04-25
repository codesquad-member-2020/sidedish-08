import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var topImageView: UIImageView!

    let network: NetworkController = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        let detailHash: DetailHash = "HBDEF"
        network.loadDetailDish(at: detailHash) { _ in }

        let url = URL(string: "https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/4cce011a4a352c22cd399a60271b4921.jpg")!

        network.loadImage(url: url) { [weak self] result in
            DispatchQueue.main.async() {
                self?.topImageView.image = result
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = false
    }
}
