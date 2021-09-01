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
    
    func getPatients(completion: @escaping () -> ()) {
        db.collection("patients").addSnapshotListener { querySnapshot, error in
            guard error == nil else {
                print("Error adding snapshot listener: \(error!.localizedDescription)")
                return completion()
            }
            self.patientArray = []
            for document in querySnapshot!.documents {
                let patient = Patient(dictionary: document.data())
                patient.docId = document.documentID
                self.patientArray.append(patient)
            }
            self.patientArray.sort(by: { $0.cardNumber < $1.cardNumber })
            completion()
        }
    }
    
    func getVisits(patient: Patient, completion: @escaping () -> ()) {
        db.collection("patients").document(patient.docId).collection("visits").addSnapshotListener { querySnapshot, error in
            guard error == nil else {
                print("Error adding snapshot listener: \(error!.localizedDescription)")
                return completion()
            }
            self.visitsArray = []
            for document in querySnapshot!.documents {
                let visit = Visit(dictionary: document.data())
                visit.docId = document.documentID
                self.visitsArray.append(visit)
            }
            self.visitsArray.sort(by: { $0.date < $1.date })
            completion()
        }
    }

    func addPatient(patientDict: [String: Any]) {
        ref = db.collection("patients").addDocument(data: patientDict, completion: { error in
            if let error = error {
                print("Error adding document \(error.localizedDescription)")
            } else {
                print("Document added with ID: \(self.ref?.documentID)")
                guard let docId = self.ref?.documentID else { return }
                self.db.collection("patients").document(docId).updateData([
                    "docId": "\(docId)"
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        })
    }
    
}
