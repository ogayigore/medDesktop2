//
//  AddPatientViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 09.07.2021.
//

import UIKit

class AddPatientViewController: UIViewController {

    //MARK:- Public Properties
    
    var dbService: DatabaseService?
    var cardNumber = 0
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! AddPatientView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = AddPatientView()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbService = DatabaseService()
        configureView()
        getCardNumber(completion: { [weak self] count in
            self!.cardNumber = count + 1
        })
    }
    
    //MARK:- Private Methods
    
    private func configureView() {
        customView.phoneNumberTextField.delegate = self
        customView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addButtonTapped() {
        guard let surname = customView.surnameTextField.text else { return }
        guard let name = customView.nameTextField.text else { return }
        guard let patronymic = customView.patronymicTextField.text else { return }
        guard let dateOfBirthString = customView.dateOfBirthTextField.text else { return }
        guard let phoneNumber = customView.phoneNumberTextField.text else { return }
        guard let email = customView.emailTextField.text else { return }
        
        if surname == "" || name == "" || dateOfBirthString == "" {
            
            customView.surnameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            customView.nameTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            customView.dateOfBirthTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            customView.alertLabel.isHidden = false
            customView.alertLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            customView.alertLabel.text = "Заполните обязательные поля!"
            
        } else {
            let newPatient = Patient(docId: "", cardNumber: cardNumber, surname: surname, name: name, patronymic: patronymic, dateOfBirth: dateOfBirthString, phoneNumber: phoneNumber, email: email)
           
            dbService?.addPatient(patientDict: newPatient.dictionary, patient: newPatient, completion: { success in
                if success {
                    print("OK")
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("ERROR")
                }
            })
        }
    }
    
    private func getCardNumber(completion: @escaping (Int) -> Void?) {
        self.dbService?.db.collection("patients").getDocuments(completion: { snapshot, error in
            if let count = snapshot?.documents.count {
                completion(count)
            } else {
                completion(0)
            }
        })
    }

}

extension AddPatientViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = customView.phoneNumberTextField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 11
    }
}
