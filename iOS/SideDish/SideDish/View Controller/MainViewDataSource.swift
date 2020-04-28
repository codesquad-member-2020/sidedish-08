import UIKit

class MainViewDataSource: NSObject, UITableViewDataSource {
    var mainDishes: [BriefDish]
    var soupDishes: [BriefDish]
    var sideDishes: [BriefDish]
    private let numberOfSections = 3

    init(mainDishes: [BriefDish] = [], soupDishes: [BriefDish] = [], sideDishes: [BriefDish] = []) {
        self.mainDishes = mainDishes
        self.soupDishes = soupDishes
        self.sideDishes = sideDishes
    }

    // MARK: Rows and Cells

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (mainDishes.count + soupDishes.count + sideDishes.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath) as! ItemCell

//        let dish = getDish(at: indexPath)
//        cell.setViewModel(ItemCellViewModel(model: dish!))

        print(indexPath)
        return cell
    }

    // MARK: Sections

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }

    private func getDish(at indexPath: IndexPath) -> BriefDish? {
        switch indexPath.section {
        case 0:
            return mainDishes[indexPath.row]
        case 1:
            return soupDishes[indexPath.row]
        case 2:
            return sideDishes[indexPath.row]
        default:
            return nil
        }
    }
}
