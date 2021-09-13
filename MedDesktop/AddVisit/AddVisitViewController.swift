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
    private var sampleString = """
            Состояние удовлетворительное. Конституция нормостеническое. Питание - нормальное.
            АД - 110/70. ЧМН: лицо симметрично OD=OS. Зрачки равновеликие, фотореакции сохранены, нистагма нет.
            Носогубные складки симметричны, язык по средней линии. Слух не нарушен. Чувствительность не изменена. Точки Валле — безболезненны.
            Мышечный тонус — умеренная гипертония паравертебральных мышц шейного, поясничного отделов, трапециевидных мышц спины. Пальпаторно: по ходу остистых отростков безболезненны. Симптомы натяжения: Лассега отрицательный, Нери — отрицательный.
            Чувствительных расстройств нет. Сухожильные рефлексы — вызываются, симметричные, паталогических рефлексов нет. Движения в полном объеме.
            """
    
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
        createToolbar(textView: customView.appointmentTextView, form: .appointment)
        createToolbar(textView: customView.diagnosisTextView, form: .diagnosis)
        customView.formButton.addTarget(self, action: #selector(formButtonTapped), for: .touchUpInside)
        customView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        customView.procedureSegmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
    }
    
    @objc private func formButtonTapped() {
        
        let currentDate = getCurrentDate()
        guard let complaintString = customView.complaintTextView.text,
              let anamnesisString = customView.anamnesisTextView.text,
              let diagnosisString = customView.diagnosisTextView.text,
              let appointmentString = customView.appointmentTextView.text,
              let recomendationString = customView.recomendationTextView.text else { return }
        
        visit = Visit(procedureName: procedureName,
                      date: currentDate,
                      price: price,
                      complaint: update(string: complaintString),
                      anamnesis: update(string: anamnesisString),
                      status: update(string: sampleString),
                      diagnosis: update(string: diagnosisString),
                      appointment: update(string: appointmentString),
                      recomendation: update(string: recomendationString),
                      docId: "",
                      visitNumber: visitNumber)
        
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
            customView.statusTextView.text = sampleString
            customView.appointmentTextView.text = ""
            customView.recomendationTextView.text = ""
        case 2:
            procedureName = "Повторный приём"
            price = 1200
            customView.statusTextView.text = sampleString
            customView.recomendationTextView.text = ""
        case 3:
            print("CASE 3")
            //TODO:- СОГЛАСИЕ
        
        default:
            break
        }
        
    }
    
    private func update(string: String) -> String {
        let updatedString = string.replacingOccurrences(of: "\n", with: "\n<br>")
        return updatedString
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
    
    private func createToolbar(textView: UITextView, form: TextViewEnum) {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        switch form {
        case .appointment:
            let medications = UIBarButtonItem(title: "Лекарства", style: .plain, target: self, action: #selector(openMedicationVC))
            toolbar.items = [medications]
            textView.inputAccessoryView = toolbar
        case .diagnosis:
            let mkb10 = UIBarButtonItem(title: "МКБ-10", style: .plain, target: self, action: #selector(openMkb10VC))
            toolbar.items = [mkb10]
            textView.inputAccessoryView = toolbar
        }
        
    }
    
    @objc private func openMkb10VC() {
        let mkb10VC = Mkb10ViewController()
        mkb10VC.modalPresentationStyle = .pageSheet
        present(mkb10VC, animated: true, completion: nil)
    }

    @objc private func openMedicationVC() {
        let medicationsVC = MedicationsViewController()
        medicationsVC.modalPresentationStyle = .pageSheet
        present(medicationsVC, animated: true, completion: nil)
    }
    
    private enum TextViewEnum {
        case diagnosis
        case appointment
    }
}
