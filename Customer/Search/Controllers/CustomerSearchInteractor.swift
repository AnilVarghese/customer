//
//  CustomerSearchInteractor.swift
//  Customer
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import Foundation

class CustomerSearchInteractor {

    private var customerFile = "Customers"
    private lazy var customers: [Customer] = {
        self.fetchCustomersFromFile(self.customerFile)
    }()

    /**
     Fetch customers from the given file name
     - parameter currentLocation: Current location coordinate
     - parameter distance: search distance
     */
    func nearbyCustomers(currentLocation: Coordinate, distance: Double) -> [Customer] {
        return customers.filter { $0.location.distance(to: currentLocation) <= distance }
    }

    /**
    Fetch customers from the given file name
     - parameter fileNAme: Name of the file to fetch cusomers.
    */
    func fetchCustomersFromFile(_ fileName: String) -> [Customer] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
            let dataString = try? String(contentsOf: fileUrl) else {
                return []
        }

        return parse(dataString: dataString)
    }

    /**
     Parse the json string into customers
     - parameter dataString: input string. One customer detail per line.
     */
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
