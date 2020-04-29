import Foundation

struct DescriptionViewModel {
    let title: String
    let subTitle: String
    let normalPrice: String
    let salePrice: String
    let point: String
    let deliveryFee: String
    let deliveryInfo: String
}

extension DescriptionViewModel {
    init(model: DetailDish?) {
        self.title = model?.title ?? ""
        self.subTitle = model?.description ?? ""
        self.normalPrice = "\(model?.normalPrice.description ?? "-")원"
        self.salePrice = "\(model?.salePrice.description ?? "-")원"
        self.point = "\(model?.point.description ?? "-")"
        self.deliveryFee = model?.deliveryFee ?? ""
        self.deliveryInfo = model?.deliveryInfo ?? ""
    }
}
