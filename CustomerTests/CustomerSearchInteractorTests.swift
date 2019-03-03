//
//  CustomerSearchInteractorTests.swift
//  CustomerTests
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import XCTest
@testable import Customer

class CustomerSearchInteractorTests: XCTestCase {
    var interactor: CustomerSearchInteractor!

    override func setUp() {
        interactor = CustomerSearchInteractor()
    }

    func testFetchCustomers() {
        let customers = interactor.fetchCustomersFromFile()
        XCTAssertTrue(customers.count > 0, "Failed to load customers")
    }

    func testNearbyCustomers() {
        // test with Dublin location
        let dublin = Coordinate(latitude: 53.339428, longitude: -6.257664)
        var customers = interactor.nearbyCustomers(currentLocation: dublin, distance: 100)
        XCTAssertEqual(customers.count, 16)

        // Testing with specific customer location
        let firstCustomerLocation = Coordinate(latitude: 52.986375, longitude: -6.043701)
        customers = interactor.nearbyCustomers(currentLocation: firstCustomerLocation, distance: 0)
        XCTAssertEqual(customers.count, 1)
        let firstCustomer = customers.first!
        XCTAssertEqual(firstCustomer.userId, 12)
    }
}
