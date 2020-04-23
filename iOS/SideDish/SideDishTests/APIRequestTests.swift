import XCTest
@testable import SideDish

class APIRequestTests: XCTestCase {
    func testMainDishRequest() {
        let data = TestData.mainDish.data(using: .utf8)!
        let request = MainDishRequest()
        let path = "main"
        let urlString = [TestData.baseURL, path].joined(separator: "/")

        let urlRequest = request.makeRequest(from: nil)
        let object = request.parseResponse(data: data)

        XCTAssertEqual(urlRequest.url, URL(string: urlString))
        XCTAssertNotNil(object)
    }

    func testDetailDishRequest() {
        let data = TestData.detailDish.data(using: .utf8)!
        let request = DetailDishRequest()
        let path = "detail"
        let detailHash: DetailHash = "HBDEF"
        let urlString = [TestData.baseURL, path, detailHash].joined(separator: "/")

        let urlRequest = request.makeRequest(from: detailHash)
        let object = request.parseResponse(data: data)

        XCTAssertEqual(urlRequest.url, URL(string: urlString))
        XCTAssertNotNil(object)
    }

    func testImageRequest() {
        let string = "http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg"
        let url = URL(string: string)!
        let request = ImageRequest()
        let image = UIImage(named: "default-image")
        let data = image?.jpegData(compressionQuality: 1)

        let urlRequest = request.makeRequest(from: url)
        let object = request.parseResponse(data: data!)

        XCTAssertNoThrow(urlRequest)
        XCTAssertNotNil(object)
    }
}

enum TestData {
    static let baseURL = "https://h3rb9c0ugl.execute-api.ap-northeast-2.amazonaws.com/develop/baminchan"
    static let mainDish = #"""
    {
        "statusCode": 200,
        "body": [
            {
                "detail_hash": "HBDEF",
                "image": "http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg",
                "alt": "[미노리키친] 규동 250g",
                "delivery_type": [
                    "새벽배송",
                    "전국택배"
                ],
                "title": "[미노리키친] 규동 250g",
                "description": "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
                "n_price": "6,500",
                "s_price": "7,000원",
                "badge": [
                    "이벤트특가"
                ]
            },
        ]
    }
    """#

    static let detailDish = #"""
    {
        "hash": "H9881",
        "data": {
                "top_image": "https://cdn.bmf.kr/_data/product/H9881/910a01a81c49cb75414edb759237501f.jpg",
                "thumb_images": ["https://cdn.bmf.kr/_data/product/H9881/910a01a81c49cb75414edb759237501f.jpg", "https://cdn.bmf.kr/_data/product/H9881/fbf29077698ca16f8050e43476b47f38.jpg", "https://cdn.bmf.kr/_data/product/H9881/c96c6949efc3391148e9b280a2c5ed0b.jpg", "https://cdn.bmf.kr/_data/product/H9881/71411e15d2d961df496f87f08648b345.jpg", "https://cdn.bmf.kr/_data/product/H9881/437196dacf46b52b11d0bccbc4231558.jpg"],
                "product_description": "경상도 명물 요리 세 가지를 한 상에!",
                "point": "312원",
                "delivery_info": "서울 경기 새벽배송 / 전국택배 (제주 및 도서산간 불가) [화 · 수 · 목 · 금 · 토] 수령 가능한 상품입니다.",
                "delivery_fee": "2,500원 (40,000원 이상 구매 시 무료)",
                "prices": ["39,000원", "31,200원"],
                "detail_section": ["https://cdn.bmf.kr/_data/product/H9881/7fb1ddf1adeadc5410cecd79441f7b65.jpg", "https://cdn.bmf.kr/_data/product/H9881/b776c59544b516a184d1363c2c802789.jpg", "https://cdn.bmf.kr/_data/product/H9881/cc2b4a61db410096db0e3c497096d63f.jpg", "https://cdn.bmf.kr/_data/product/H9881/77970960c8efe0992f9746c37062e1e4.jpg", "https://cdn.bmf.kr/_data/product/H9881/aa56cec7d2fe4dde0b124c17a06ffda6.jpg", "https://cdn.bmf.kr/_data/product/H9881/c9fbe313767400ce21ea83bb2b9d8e96.jpg", "https://cdn.bmf.kr/_data/product/H9881/320939f0d0fbe8e4846e20111f1aa4ce.jpg", "https://cdn.bmf.kr/_data/product/H9881/5778ae933121c5d131889ecbf5e2874c.jpg", "https://cdn.bmf.kr/_data/product/H9881/785291ed7fe3f2a8c7e06f443dea7553.jpg", "https://cdn.bmf.kr/_data/product/H9881/92ef47f6efdd0286f6af7f712c3c838d.jpg", "https://cdn.bmf.kr/_data/product/H9881/c0319354245ee2963ccb97d60943e8ff.jpg", "https://cdn.bmf.kr/_data/product/H9881/07b1864a06f3b0b26af9a7148ac70cfb.jpg", "https://cdn.bmf.kr/_data/product/H9881/ba2aba220a55924a00c668dd13c4cee1.jpg"]
        }
    }
    """#
}

