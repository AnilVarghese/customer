//
//  Coordinate.swift
//  Customer
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double

    /**
     Calculate distance to other cordinate
     - parameter to: Other coordinate.
     */
    func distance(to: Coordinate) -> Double {
        let theta = longitude - to.longitude
        var distance = sin(degreeToRadians(latitude)) * sin(degreeToRadians(to.latitude)) + cos(degreeToRadians(latitude)) * cos(degreeToRadians(to.latitude)) * cos(degreeToRadians(theta))
        distance = acos(distance)
        distance = radianTodegree(distance)
        distance = distance * 60 * 1.1515 // miles
        distance = distance * 1.609344 // km
        return distance
    }

    func degreeToRadians(_ degree: Double) -> Double {
        return degree * Double.pi / 180
    }

    func radianTodegree(_ radian: Double) -> Double {
        return radian * 180.0 / Double.pi
    }
}
