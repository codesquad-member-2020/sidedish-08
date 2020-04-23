import UIKit

final class MainViewController: UIViewController {
    var loader: RequestLoader<MainDishRequest>?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self

        loadMainDish()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true

        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: animated)
        }
    }
}

// MARK: - TableView DataSource

// TODO: 별도 클래스로 분리
extension MainViewController: UITableViewDataSource {
    // MARK: Rows and Cells

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath)

        return cell
    }

    // MARK: Sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}

// MARK: - TableView Delegate

// TODO: 별도 클래스로 분리
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier)
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

// MARK: - HTTP Requests

private extension MainViewController {
    // TODO: 구현할 것
    func loadMainDish() {
        self.loader = RequestLoader(apiRequest: MainDishRequest())

        loader?.load(with: nil) { (result) in
            switch result {
            case .success(let data):
                debugPrint(data)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }

}

