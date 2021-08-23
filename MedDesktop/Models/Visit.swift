//
//  Visit.swift
//  MedDesktop
//
//  Created by Igor Ogai on 04.08.2021.
//

import Foundation

struct Visit {
    var procedureName: String
    var date: String
    var price: Double
    var description: String
    
    var dictionary: [String: Any] {
        return [
            "procedureName": procedureName,
            "date": date,
            "price": price,
            "description": description
        ]
    }
}

extension Visit: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let procedureName = dictionary["procedureName"] as? String,
              let date = dictionary["date"] as? String,
              let price = dictionary["price"] as? Double,
              let description = dictionary["description"] as? String else { return nil }
        self.init(procedureName: procedureName, date: date, price: price, description: description)
    }
    
}
