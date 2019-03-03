//
//  CustomerTests.swift
//  CustomerTests
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import XCTest
@testable import Customer

class CustomerTests: XCTestCase {
    func testCustomer() {
        guard let json = """
                {
                    "latitude": "52.986375",
                    "user_id": 12,
                    "name": "Christina McArdle",
                    "longitude": "-6.043701"
                }
            """.data(using: .utf8) else {
                XCTFail("Not a proper json")
                return
        }

        let decoder = JSONDecoder()
        let customer = try? decoder.decode(Customer.self, from: json)
        XCTAssertNotNil(customer, "Could not parse Customer object")
    }
}
