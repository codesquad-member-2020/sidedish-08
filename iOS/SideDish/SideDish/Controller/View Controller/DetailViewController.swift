import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var topImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let detailHash: DetailHash = "HBDEF"
        loadDetailDish(at: detailHash)
        loadImage()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - HTTP Requests

extension DetailViewController {
    // TODO: 구현할 것
    func loadDetailDish(at detailHash: DetailHash) {
        let loader = RequestLoader(apiRequest: DetailDishRequest())

        loader.load(with: detailHash) { [weak self] (result) in
            switch result {
            case .success(let data):
                debugPrint(data)
//                self?.loadImage()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    // TODO: 구현할 것
    func loadImage() {
        let loader = RequestLoader(apiRequest: ImageRequest())

        let url = URL(string: "https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/4cce011a4a352c22cd399a60271b4921.jpg")

        loader.load(with: url) { [weak self] (result) in
            switch result {
            case .success(let data):
                debugPrint(data)
                DispatchQueue.main.async {
                    self?.topImageView.image = data
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
