import UIKit

final class DetailViewController: UIViewController {
    var loader: RequestLoader<DetailDishRequest>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let detailHash: DetailHash = "HBDEF"
        loadDetailDish(detailHash)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = false
    }

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
}
