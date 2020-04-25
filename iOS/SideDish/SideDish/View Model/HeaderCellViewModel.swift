import Foundation

struct HeaderCellViewModel {
    let title: String
    let subTitle: String
}

extension HeaderCellViewModel {
    init(model: MainDishHeader) {
        self.title = model.title
        self.subTitle = model.description
    }
}
