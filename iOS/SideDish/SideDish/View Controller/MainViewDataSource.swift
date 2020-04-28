import UIKit

enum DishList: Int, CaseIterable {
    case main
    case soup
    case side
}

class MainViewDataSource: NSObject, UITableViewDataSource {
    var dishes: [[BriefDish]] = .init(repeating: [], count: DishList.allCases.count)

    // MARK: Rows and Cells

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell

        if let dish = getDish(at: indexPath) {
            cell.setViewModel(ItemCellViewModel(model: dish))
        }

        return cell
    }

    // MARK: Sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return dishes.count
    }

    private func getDish(at indexPath: IndexPath) -> BriefDish? {
        return dishes[indexPath.section][indexPath.row]
    }

    func updateList<T>(_ tableView: UITableView, list: DishList, result: T) {
        guard let result = result as? BriefDishWrapper else { return }

        dishes[list.rawValue] = result.unwrapped()
        DispatchQueue.main.sync {
            tableView.insertRows(at: self.indexPaths(for: list), with: .automatic)
        }
    }

    private func indexPaths(for list: DishList) -> [IndexPath] {
        let section = list.rawValue
        let indexPaths: [IndexPath] = (0..<self.dishes[section].count).map { IndexPath(row: $0, section: section) }

        return indexPaths
    }
}
