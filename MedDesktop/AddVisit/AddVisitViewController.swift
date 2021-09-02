//
//  AddVisitViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 05.08.2021.
//

import UIKit
import Firebase

class AddVisitViewController: UIViewController {
    
    //MARK:- Public Properties
    
    var dbService: DatabaseService?
    var patient: Patient!
    var visit: Visit!
    var visitNumber = 0
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! AddVisitView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = AddVisitView()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbService = DatabaseService()
        configureView()
        getVisitNumber(patient: patient) { [weak self] count in
            self?.visitNumber = count + 1
        }
    }
    
    //MARK:- Private Methods
    
    private func configureView() {
        customView.formButton.addTarget(self, action: #selector(formButtonTapped), for: .touchUpInside)
        customView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func formButtonTapped() {
        
        let currentDate = getCurrentDate()
        
        visit = Visit(procedureName: customView.procedureTextField.text!, date: currentDate, price: 1000, complaint: customView.complaintTextView.text!, anamnesis: customView.anamnesisTextView.text!, status: customView.statusTextView.text!, diagnosis: customView.diagnosisTextView.text!, appointment: customView.appointmentTextView.text!, recomendation: customView.recomendationTextView.text!, docId: "", visitNumber: visitNumber)
        
        let printVisitViewController = PrintVisitViewController()
        printVisitViewController.modalPresentationStyle = .fullScreen
        printVisitViewController.patient = patient
        printVisitViewController.visit = visit
        present(printVisitViewController, animated: true, completion: nil)
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    
    private func calcAge(birthday: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let birthdayDate = dateFormatter.date(from: birthday)
        let now = Date()
        let calendar = Calendar.current
        
        let calcAge = calendar.dateComponents([.year, .month], from: birthdayDate!, to: now)
        guard let age = calcAge.year else { return "0" }
        if age == 0 {
            guard let month = calcAge.month else { return "0" }
            return "\(month)мес."
        } else {
            return "\(age)"
        }
    }
    
    private func getVisitNumber(patient: Patient, completion: @escaping (Int) -> Void?) {
        self.dbService?.db.collection("patients").document(patient.docId).collection("visits").getDocuments(completion: { snapshot, error in
            if let count = snapshot?.documents.count {
                completion(count)
            } else {
                completion(0)
            }
        })
    }
}
