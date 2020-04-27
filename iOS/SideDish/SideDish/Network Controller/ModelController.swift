import Foundation

class ModelController {
    private let mainCategory: Category = .init(title: "언제 먹어도 든든한 반찬", subTitle: "밥과 함께")
    private let soupCategory: Category = .init(title: "김이 모락모락 국물요리", subTitle: "국・찌개")
    private let sideCategory: Category = .init(title: "없으면 섭섭한 밑반찬", subTitle: "반찬")

    private(set) var categories: [Category]

    init(categories: [Category] = .init()) {
        self.categories = categories
    }

    init() {
        self.categories = [mainCategory, soupCategory, sideCategory]
    }
}
