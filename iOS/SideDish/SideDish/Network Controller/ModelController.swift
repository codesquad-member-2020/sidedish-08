import Foundation

class ModelController {
    private let mainCategory: Category = .init(title: "한그릇 뚝딱 메인 요리", subTitle: "메인반찬")
    private let soupCategory: Category = .init(title: "김이 모락모락 국・찌개", subTitle: "국・찌개")
    private let sideCategory: Category = .init(title: "언제 먹어도 든든한 밑반찬", subTitle: "밑반찬")

    private(set) var categories: [Category]

    init(categories: [Category] = .init()) {
        self.categories = categories
    }

    init() {
        self.categories = [mainCategory, soupCategory, sideCategory]
    }
}
