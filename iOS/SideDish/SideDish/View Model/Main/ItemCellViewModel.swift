import Foundation

struct ItemCellViewModel {
    let imageURL: ImageURL
    let title: String
    let description: String
    let normalPrice: String
    let salePrice: String
    let badges: [Badge]
}

extension ItemCellViewModel {
    init(model: MainDish) {
        self.imageURL = model.imageURL
        self.title = model.title
        self.description = model.description
        self.normalPrice = "\(model.normalPrice) 원"
        self.salePrice = "\(model.salePrice) 원"
        self.badges = model.badges
    }
}
