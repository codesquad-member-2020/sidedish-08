import UIKit

class MainViewDataSource: NSObject, UITableViewDataSource {
    var mainDishes: [MainDish] = []

    // MARK: Rows and Cells

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainDishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell

        let mainDish = mainDishes[indexPath.row]
        cell.viewModel = ItemCellViewModel(model: mainDish)

        return cell
    }

    // MARK: Sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

}
