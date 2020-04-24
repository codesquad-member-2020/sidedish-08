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
    static let baseURL = "http://13.125.127.249:8080/sidedish08/api"
    static let mainDish = #"""
    {
      "message": "SUCCESS",
      "contents": {
        "body": [
          {
            "hash": "HBDEF",
            "image": "http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg",
            "alt": "[미노리키친] 규동 250g",
            "deliveryType": [
              "EARLY_MORNING",
              "NATIONAL"
            ],
            "title": "[미노리키친] 규동 250g",
            "description": "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
            "normalPrice": 6500,
            "salePrice": 6500,
            "badge": [
              "EVENT",
              "LAUNCHING"
            ]
          },
          {
            "hash": "HDF73",
            "image": "http://public.codesquad.kr/jk/storeapp/data/7674311a02ba7c88675f3186ddaeef9e.jpg",
            "alt": "[빅마마의밥친구] 아삭 고소한 연근고기조림 250g",
            "deliveryType": [],
            "title": "[빅마마의밥친구] 아삭 고소한 연근고기조림 250g",
            "description": "편식하는 아이도 좋아하는 건강한 연근조림",
            "normalPrice": 5500,
            "salePrice": 5500,
            "badge": []
          }
        ]
      }
    }
    """#

    static let detailDish = #"""
    {
      "message": "SUCCESS",
      "contents": {
        "data": {
          "hash": "HBDEF",
          "topImage": "http://public.codesquad.kr/jk/storeapp/data/2d3f99a9a35601f4e98837bc4d39b2c8.jpg",
          "thumbImages": [
            "https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/4cce011a4a352c22cd399a60271b4921.jpg",
            "https://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/6ef14155afc5b47e8c9efd762f7a6096.jpg"
          ],
          "detailImages": [
            "http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/a8c434715709fe855f3ea1554ec362b6.jpg",
            "http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/b2b3d0d2107ab91b16e0eb804cd84bc9.jpg",
            "http://public.codesquad.kr/jk/storeapp/data/detail/HBDEF/c0dd6887c9d9368604fc70d7fc3c4598.jpg"
          ],
          "normalPrice": 6500,
          "salePrice": 6500,
          "description": "일본인의 소울푸드! 한국인도 좋아하는 소고기덮밥",
          "point": 65,
          "deliveryInfo": "서울 경기 새벽배송/전국택배(제주 및 도서산간 불가) [월, 화, 수, 목, 금, 토, 일] 수령 가능한 상품입니다.",
          "deliveryFee": "2800원 (40000원 이상 구매 시 무료)",
          "badges": [
            "EVENT",
            "LAUNCHING"
          ]
        }
      }
    }
    """#
}

