//
//  DatabaseService.swift
//  MedDesktop
//
//  Created by Igor Ogai on 13.07.2021.
//

import Foundation
import Firebase

class DatabaseService {
    
    var db: Firestore!
    var patientArray = [Patient]()
    var visitsArray = [Visit]()
    var ref: DocumentReference? = nil
    
    init() {
        db = Firestore.firestore()
    }
    
    
}
