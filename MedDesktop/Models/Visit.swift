//
//  Visit.swift
//  MedDesktop
//
//  Created by Igor Ogai on 04.08.2021.
//

import Foundation

class Visit {
    var dbService: DatabaseService!
    
    var procedureName: String
    var date: String
    var price: Double
    var complaint: String
    var anamnesis: String
    var status: String
    var diagnosis: String
    var appointment: String
    var recomendation: String
    var docId: String
    var visitNumber: Int
    
    var dictionary: [String: Any] {
        return [
            "procedureName": procedureName,
            "date": date,
            "price": price,
            "complaint": complaint,
            "anamnesis": anamnesis,
            "status": status,
            "diagnosis": diagnosis,
            "appointment": appointment,
            "recomendation": recomendation,
            "visitNumber": visitNumber
        ]
    }
    
    init(procedureName: String, date: String, price: Double, complaint: String, anamnesis: String, status: String, diagnosis: String, appointment: String, recomendation: String, docId: String, visitNumber: Int) {
        self.procedureName = procedureName
        self.date = date
        self.price = price
        self.complaint = complaint
        self.anamnesis = anamnesis
        self.status = status
        self.diagnosis = diagnosis
        self.appointment = appointment
        self.recomendation = recomendation
        self.docId = docId
        self.visitNumber = visitNumber
    }
    
    convenience init() {
        self.init(procedureName: "", date: "", price: 0, complaint: "", anamnesis: "", status: "", diagnosis: "", appointment: "", recomendation: "", docId: "", visitNumber: 0)
    }
    
    convenience init(dictionary: [String : Any]) {
        let procedureName = dictionary["procedureName"] as! String? ?? ""
        let date = dictionary["date"] as! String? ?? ""
        let price = dictionary["price"] as! Double? ?? 0
        let complaint = dictionary["complaint"] as! String? ?? ""
        let anamnesis = dictionary["anamnesis"] as! String? ?? ""
        let status = dictionary["status"] as! String? ?? ""
        let diagnosis = dictionary["diagnosis"] as! String? ?? ""
        let appointment = dictionary["appointment"] as! String? ?? ""
        let recomendation = dictionary["recomendation"] as! String? ?? ""
        let docId = dictionary["docId"] as! String? ?? ""
        let visitNumber = dictionary["visitNumber"] as! Int? ?? 0
                
        self.init(procedureName: procedureName, date: date, price: price, complaint: complaint, anamnesis: anamnesis, status: status, diagnosis: diagnosis, appointment: appointment, recomendation: recomendation, docId: docId, visitNumber: visitNumber)
    }
    
    func saveData(patient: Patient, completion: @escaping (Bool) -> ()) {
        dbService = DatabaseService()
        let dataToSave: [String: Any] = self.dictionary
        
        if self.docId == "" {
            dbService.ref = dbService?.db.collection("patients").document(patient.docId).collection("visits").addDocument(data: dataToSave) { error in
                guard error == nil else {
                    print("Error adding document: \(error!.localizedDescription)")
                    return completion(false)
                }
                self.docId = self.dbService.ref!.documentID
                print("Added document: \(self.docId) to patient: \(patient.docId)")
                completion(true)
            }
        } else {
            let ref = dbService.db.collection("patients").document(patient.docId).collection("visits").document(self.docId)
            ref.setData(dataToSave) { error in
                guard error == nil else {
                    print("Error updating document: \(error!.localizedDescription)")
                    return completion(false)
                }
                print("Updated document: \(self.docId) in patients: \(patient.docId)")
                completion(true)
            }
        }
        
        
    }
}
