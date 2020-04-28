import UIKit

final class MainViewController: UIViewController {
    let network: NetworkController = .init()
    let modelController: ModelController = .init()
    let dataSource: MainViewDataSource = .init()
    let delegate: MainViewDelegate = .init()

    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate.categories = modelController.categories

        tableView.dataSource = dataSource
        tableView.delegate = delegate

        loadDishList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    private func loadDishList() {
        network.loadDishList(with: MainDishRequest()) { result in
            self.dataSource.updateList(self.tableView, list: .main, result: result)
        }

        network.loadDishList(with: SoupDishRequest()) { result in
            self.dataSource.updateList(self.tableView, list: .soup, result: result)
        }

        network.loadDishList(with: SideDishRequest()) { result in
            self.dataSource.updateList(self.tableView, list: .side, result: result)
        }
    }

}
