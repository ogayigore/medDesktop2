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
    }
    
    //MARK:- Private Methods
    
    private func configureView() {
        customView.formButton.addTarget(self, action: #selector(formButtonTapped), for: .touchUpInside)
        customView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func formButtonTapped() {
        print("formButtonTapped()")
        guard let procedureName = customView.procedureTextField.text else { return }
        guard let complaint = customView.complaintTextView.text else { return }
        guard let anamnesis = customView.anamnesisTextView.text else { return }
        guard let status = customView.statusTextView.text else { return }
        guard let diagnosis = customView.diagnosisTextView.text else { return }
        guard let appointment = customView.appointmentTextView.text else { return }
        guard let recomendation = customView.recomendationTextView.text else { return }
        
        guard let patientPatronymic = patient.patronymic else { return }
        guard let patientEmail = patient.email else { return }
        
        let age = calcAge(birthday: patient.dateOfBirth)
        let currentDate = getCurrentDate()
        
        let description = "\(procedureName)\nФИО - \(patient.surname) \(patient.name) \(patientPatronymic)\nДата рождения - \(patient.dateOfBirth)\nВозраст - \(age)\nНомер телефона - \(patient.phoneNumber)\nEmail - \(patientEmail)\nДата и время осмотра - \(currentDate)\n \nЖалобы - \(complaint)\n \nАнамнез - \(anamnesis)\n \nСтатус - \(status)\n \nДиагноз - \(diagnosis)\n \nНазначение - \(appointment)\n \nРекомендации - \(recomendation)\n \n \nВрач невролог Цой Лариса Семеновна"
        
        let visit = Visit(procedureName: procedureName, date: currentDate, price: 1000, description: description)
        
//        let visitRef = dbService?.db.collection("patients").document(patient.docId)
//        visitRef?.updateData([
//            "visit": FieldValue.arrayUnion([visit])
//        ])
        
        let printVisitViewController = PrintVisitViewController()
        printVisitViewController.modalPresentationStyle = .fullScreen
        printVisitViewController.visit = visit
        printVisitViewController.patient = patient
        navigationController?.pushViewController(printVisitViewController, animated: true)
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
}

struct Test {
    var name: String
    var surname: String
}
