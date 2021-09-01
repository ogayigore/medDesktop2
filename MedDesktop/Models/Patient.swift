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

class Patient {
    var docId: String
    var cardNumber: Int
    var surname: String
    var name: String
    var patronymic: String?
    var dateOfBirth: String
    var phoneNumber: String?
    var email: String?
    
    var dictionary: [String: Any] {
        return [
            "docId": docId,
            "cardNumber": cardNumber,
            "surname": surname,
            "name": name,
            "patronymic": patronymic ?? "",
            "dateOfBirth": dateOfBirth,
            "phoneNumber": phoneNumber ?? "",
            "email": email ?? ""
        ]
    }
    
    init(docId: String, cardNumber: Int, surname: String, name: String, patronymic: String?, dateOfBirth: String, phoneNumber: String?, email: String?) {
        self.docId = docId
        self.cardNumber = cardNumber
        self.surname = surname
        self.name = name
        self.patronymic = patronymic
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    convenience init() {
        self.init(docId: "", cardNumber: 0, surname: "", name: "", patronymic: "", dateOfBirth: "", phoneNumber: "", email: "")
    }
    
    convenience init(dictionary: [String : Any]) {
        let docId = dictionary["docId"] as! String? ?? ""
        let cardNumber = dictionary["cardNumber"] as! Int? ?? 0
        let surname = dictionary["surname"] as! String? ?? ""
        let name = dictionary["name"] as! String? ?? ""
        let patronymic = dictionary["patronymic"] as! String? ?? ""
        let dateOfBirth = dictionary["dateOfBirth"] as! String? ?? ""
        let phoneNumber = dictionary["phoneNumber"] as! String? ?? ""
        let email = dictionary["email"] as! String? ?? ""
        
        self.init(docId: docId, cardNumber: cardNumber, surname: surname, name: name, patronymic: patronymic, dateOfBirth: dateOfBirth, phoneNumber: phoneNumber, email: email)
    }
}


    

