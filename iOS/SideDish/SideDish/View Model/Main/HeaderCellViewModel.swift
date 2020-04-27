import Foundation

struct HeaderCellViewModel {
    let title: String
    let subTitle: String
}

extension HeaderCellViewModel {
    init(model: Category) {
        self.title = model.title
        self.subTitle = model.subTitle
    }
}
