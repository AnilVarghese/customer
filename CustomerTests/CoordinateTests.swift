//
//  CoordinateTests.swift
//  CustomerTests
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import XCTest
@testable import Customer

class CoordinateTests: XCTestCase {
    func testDegreeToRadian() {
        let dublin = Coordinate(latitude: 53.339428, longitude: -6.257664)
        let radian = dublin.degreeToRadians(53.34).rounded(toDecimalPlace: 2) // rouding for comparison
        XCTAssertEqual(radian, 0.93)
    }

    func testRadianToDegree() {
        let dublin = Coordinate(latitude: 53.339428, longitude: -6.257664)
        let degree = dublin.radianTodegree(0.931).rounded(toDecimalPlace: 2) // rouding for comparison
        XCTAssertEqual(degree, 53.34)
    }

    func testDistanceCalculation() {
        let dublin = Coordinate(latitude: 53.339428, longitude: -6.257664)
        let customerLocation = Coordinate(latitude: 52.986375, longitude: -6.043701)
        let distance = dublin.distance(to: customerLocation).rounded(toDecimalPlace: 2)
        XCTAssertEqual(distance, 41.77)
    }
}
