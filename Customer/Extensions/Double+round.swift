//
//  Double+round.swift
//  Customer
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import Foundation

public extension Double {
    func rounded(toDecimalPlace: Double) -> Double {
        return (self * pow(10, toDecimalPlace)).rounded() / pow(10, toDecimalPlace)
    }
}
