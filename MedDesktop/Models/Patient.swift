//
//  Patient.swift
//  MedDesktop
//
//  Created by Igor Ogai on 09.07.2021.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}

struct Patient {
    var docId: String
    var cardNumber: Int
    var surname: String
    var name: String
    var patronymic: String?
    var dateOfBirth: String
    var phoneNumber: String
    var email: String?
    var visit: [Visit]
    
    var dictionary: [String: Any] {
        return [
            "docId": docId,
            "cardNumber": cardNumber,
            "surname": surname,
            "name": name,
            "patronymic": patronymic ?? "",
            "dateOfBirth": dateOfBirth,
            "phoneNumber": phoneNumber,
            "email": email ?? "",
            "visit": visit
        ]
    }
    
}

extension Patient: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let docId = dictionary["docId"] as? String,
              let cardNumber = dictionary["cardNumber"] as? Int,
              let surname = dictionary["surname"] as? String,
              let name = dictionary["name"] as? String,
              let patronymic = dictionary["patronymic"] as? String?,
              let dateOfBirth = dictionary["dateOfBirth"] as? String,
              let phoneNumber = dictionary["phoneNumber"] as? String,
              let email = dictionary["email"] as? String?,
              let visit = dictionary["visit"] as? [Visit] else { return nil }
        self.init(docId: docId, cardNumber: cardNumber, surname: surname, name: name, patronymic: patronymic, dateOfBirth: dateOfBirth, phoneNumber: phoneNumber, email: email, visit: visit)
    }

}
