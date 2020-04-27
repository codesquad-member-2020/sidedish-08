import UIKit

class MainViewDelegate: NSObject, UITableViewDelegate {
    var categories: [Category]

    init(categories: [Category]) {
        self.categories = categories
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: HeaderCell.reuseIdentifier) as! HeaderCell

        let category = categories[section]
        view.viewModel = HeaderCellViewModel(model: category)
        view.setup()

        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
