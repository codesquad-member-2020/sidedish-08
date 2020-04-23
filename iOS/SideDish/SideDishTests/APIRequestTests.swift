import XCTest
@testable import SideDish

class APIRequestTests: XCTestCase {
    func testMainDishRequest() {
        let data = mainDishString.data(using: .utf8)!
        let request = MainDishRequest()

        let object = request.parseResponse(data: data)

        XCTAssertNotNil(object)
    }

    let mainDishString = #"""
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

}
