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
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! AddVisitView
    private var visitNumber = 0
    private var price = 0.0
    private var procedureName = ""
    
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
        customView.complaintTextView.delegate = self
        customView.anamnesisTextView.delegate = self
        customView.statusTextView.delegate = self
        customView.diagnosisTextView.delegate = self
        customView.appointmentTextView.delegate = self
        customView.recomendationTextView.delegate = self
        createToolbar(textView: customView.appointmentTextView)
        customView.formButton.addTarget(self, action: #selector(formButtonTapped), for: .touchUpInside)
        customView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        customView.procedureSegmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
    }
    
    @objc private func formButtonTapped() {
        
        let currentDate = getCurrentDate()
        
        visit = Visit(procedureName: procedureName, date: currentDate, price: price, complaint: customView.complaintTextView.text!, anamnesis: customView.anamnesisTextView.text!, status: customView.statusTextView.text!, diagnosis: customView.diagnosisTextView.text!, appointment: customView.appointmentTextView.text!, recomendation: customView.recomendationTextView.text!, docId: "", visitNumber: visitNumber)
        
        let printVisitViewController = PrintVisitViewController()
        printVisitViewController.modalPresentationStyle = .fullScreen
        printVisitViewController.patient = patient
        printVisitViewController.visit = visit
        printVisitViewController.saved = 0
        present(printVisitViewController, animated: true, completion: nil)
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func segmentedAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeSample(for: 1)
        case 1: changeSample(for: 2)
        case 2: changeSample(for: 3)
        default:
            break
        }
    }
    
    private func changeSample(for index: Int) {
        switch index {
        case 1:
            procedureName = "Первичный приём"
            price = 1000
            customView.statusTextView.text = """
            Состояние удовлетворительное. Питание - повышенное.
            <br>АД - . ЧМН: лицо симметрично OD=OS. Зрачки равновеликие, фотореакции сохранены, нистагма нет.
            <br>Носогубные складки симметричны, язык по средней линии. Слух не нарушен. Чувствительность не изменена
            """
            customView.appointmentTextView.text = ""
            customView.recomendationTextView.text = ""
        case 2:
            procedureName = "Повторный приём"
            price = 1200
            customView.statusTextView.text = """
            Состояние удовлетворительное. Питание - повышенное.
            <br>АД - . ЧМН: лицо симметрично OD=OS. Зрачки равновеликие, фотореакции сохранены, нистагма нет.
            <br>Носогубные складки симметричны, язык по средней линии. Слух не нарушен. Чувствительность не изменена
            """
            customView.recomendationTextView.text = ""
        case 3:
            print("CASE 3")
            //TODO:- СОГЛАСИЕ
        
        default:
            break
        }
        
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
    
    private func createToolbar(textView: UITextView) {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        let medications = UIBarButtonItem(title: "Лекарства", style: UIBarButtonItem.Style.plain, target: self, action: #selector(openVC))
        toolbar.items = [medications]
        textView.inputAccessoryView = toolbar
    }

    @objc private func openVC() {
        let medicationsVC = MedicationsViewController()
        medicationsVC.modalPresentationStyle = .pageSheet
        present(medicationsVC, animated: true, completion: nil)
    }
    
}

extension AddVisitViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text.last == "\n" {
            textView.text += "<br>"
            print("TEXT - \(textView.text)")
            return false
        }
        return true
    }
}
