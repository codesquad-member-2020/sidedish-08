import UIKit

final class MainViewController: UIViewController {
    let network: NetworkController = .init()
    let modelController: ModelController = .init()
    let dataSource: MainViewDataSource = .init()
    let delegate: MainViewDelegate = .init()
    let detailSegueIdentifier = "DetailSegue"

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == detailSegueIdentifier else { return }
        guard let destination = segue.destination as? DetailViewController else { return }

        if let indexPath = tableView.indexPathForSelectedRow, let detailDish = dataSource.getDish(at: indexPath) {
            destination.detailHash = detailDish.hash
        }
    }

    private func loadDishList() {
        network.loadDishList(with: MainDishRequest()) { result in
            self.dataSource.updateList(self.tableView, list: .main, result: result.unwrapped())
        }

        network.loadDishList(with: SoupDishRequest()) { result in
            self.dataSource.updateList(self.tableView, list: .soup, result: result.unwrapped())
        }

        network.loadDishList(with: SideDishRequest()) { result in
            self.dataSource.updateList(self.tableView, list: .side, result: result.unwrapped())
        }
    }

}
