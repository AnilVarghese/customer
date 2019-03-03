//
//  CustomerSearchInteractor.swift
//  Customer
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import Foundation

class CustomerSearchInteractor {

    lazy var customers: [Customer] = {
        self.fetchCustomersFromFile()
    }()

    func nearbyCustomers(currentLocation: Coordinate, distance: Double) -> [Customer] {
        return customers.filter { $0.location.distance(to: currentLocation) <= distance }
    }

    func fetchCustomersFromFile() -> [Customer] {
        guard let fileUrl = Bundle.main.url(forResource: "Customers", withExtension: "txt"),
            let dataString = try? String(contentsOf: fileUrl) else {
                return []
        }

        return parse(dataString: dataString)
    }

    func parse(dataString: String) -> [Customer] {
        var customers = [Customer]()
        dataString.components(separatedBy: "\n").forEach {
            if let json = $0.data(using: .utf8) {
                let decoder = JSONDecoder()
                if let customer = try? decoder.decode(Customer.self, from: json) {
                    customers.append(customer)
                }
            }
        }
        return customers
    }
}
