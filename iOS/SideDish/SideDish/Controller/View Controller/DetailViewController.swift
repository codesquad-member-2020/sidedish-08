import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet weak var topImageView: UIImageView!

    var loader: RequestLoader<DetailDishRequest>?
    var imageLoader: RequestLoader<ImageRequest>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let detailHash: DetailHash = "HBDEF"
        loadDetailDish(detailHash)
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
    func loadDetailDish(_ detailHash: DetailHash) {
        self.loader = RequestLoader(apiRequest: DetailDishRequest())

        loader?.load(with: detailHash) { (result) in
            switch result {
            case .success(let data):
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

    // TODO: 구현할 것
    func loadImage() {
        self.imageLoader = RequestLoader(apiRequest: ImageRequest())
        let url = URL(string: "https://cdn.pixabay.com/photo/2019/10/04/18/36/milky-way-4526277_1280.jpg")

        imageLoader?.load(with: url) { (result) in
            switch result {
            case .success(let data):
                debugPrint(data)
                DispatchQueue.main.async {
                    self.topImageView.image = data
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
