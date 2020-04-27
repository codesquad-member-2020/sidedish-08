import UIKit

class MainViewDataSource: NSObject, UITableViewDataSource {
    var dishes: [MainDish]

    init(dishes: [MainDish]) {
        self.dishes = dishes
    }

    // MARK: Rows and Cells

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell

        let dish = dishes[indexPath.row]
        cell.viewModel = ItemCellViewModel(model: dish)
        cell.setup()

        return cell
    }

    // MARK: Sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}
