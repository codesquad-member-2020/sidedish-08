import UIKit

final class MainViewController: UIViewController {
    let network: NetworkController = .init()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self

        let network = NetworkController()
        network.loadMainDish(onSuccess: configureMainDish(_:))
    }

    func configureMainDish(_ entity: MainDishWrapper?) {
        print(entity?.message)
        let firstMainDish = entity?.contents.body.first!
        print(firstMainDish)

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
