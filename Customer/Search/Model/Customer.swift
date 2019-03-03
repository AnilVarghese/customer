//
//  Customer.swift
//  Customer
//
//  Created by Anil Varghese on 03/03/19.
//  Copyright © 2019 Anil Varghese. All rights reserved.
//

import UIKit

struct Customer {
    let userId: Int
    let name: String
    let location: Coordinate

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case latitude
        case longitude
    }
}

extension Customer: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decode(Int.self, forKey: .userId)
        name = try values.decode(String.self, forKey: .name)
        let latitude = try values.decode(String.self, forKey: .latitude)
        let longitude = try values.decode(String.self, forKey: .longitude)
        location = Coordinate(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
}
