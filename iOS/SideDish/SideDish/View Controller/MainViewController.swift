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

        loadData()
    }

    func loadData() {
        let queue = DispatchQueue(label: "sideDish.network.dishList")
        queue.async {
            self.network.loadDishList(with: MainDishRequest()) { result in
                self.dataSource.mainDishes = result.unwrapped()
            }
        }

        self.network.loadDishList(with: SoupDishRequest()) {
            self.dataSource.soupDishes = $0.unwrapped()
        }

        self.network.loadDishList(with: SideDishRequest()) {
            self.dataSource.sideDishes = $0.unwrapped()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    // MARK: - Private

    private func setupViews(mainDish: BriefDishWrapper) {
        dataSource.mainDishes = mainDish.unwrapped()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
