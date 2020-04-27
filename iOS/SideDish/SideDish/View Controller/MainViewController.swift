import UIKit

final class MainViewController: UIViewController {
    let network: NetworkController = .init()
    let modelController: ModelController = .init()
    let dataSource: MainViewDataSource = .init(dishes: [])
    let delegate: MainViewDelegate = .init(categories: [])

    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate.categories = modelController.categories
        network.loadMainDish(onSuccess: setupViews(mainDish:))

        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    // MARK: - Private

    private func setupViews(mainDish: [MainDish]) {
        dataSource.dishes = mainDish
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
