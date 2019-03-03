//
//  FileOperationTests.swift
//  CustomerTests
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import XCTest

class FileOperationTests: XCTestCase {
    func testReadingDataFromFile() {
        guard let fileUrl = Bundle.main.url(forResource: "Customers", withExtension: "txt") else {
            XCTFail("File not found - Customers.txt")
            return
        }

        guard let input = try? String(contentsOf: fileUrl),
            input.count > 0 else {
                XCTFail("Customer.txt file is empty ")
                return
        }
    }
}
