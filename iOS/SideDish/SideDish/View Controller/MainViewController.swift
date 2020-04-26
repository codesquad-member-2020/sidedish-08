import UIKit

final class MainViewController: UIViewController {
    let network: NetworkController = .init()
    let dataSource: MainViewDataSource = .init()
    let delegate: MainViewDelegate = .init()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.delegate

        network.loadMainDish(onSuccess: configureView(_:))
    }

    func configureView(_ mainDish: [MainDish]) {
        dataSource.mainDishes = mainDish
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: animated)
        }
    }
}
