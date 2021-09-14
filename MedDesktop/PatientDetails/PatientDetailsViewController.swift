//
//  PatientDetailsViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 28.07.2021.
//

import UIKit

class PatientDetailsViewController: UIViewController {
    
    //MARK:- Private Properties
    
    private(set) lazy var customView = view as! PatientDetailsView
    
    private var navButtons = [UIBarButtonItem]()
    
    //MARK:- Public Properties
    
    var dbService: DatabaseService!
    var patient: Patient?
    let imagesArray = [UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank"), UIImage(named: "bank")]
//    let imagesArray = [UIImage]()
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = PatientDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbService = DatabaseService()
        setup()
        barButtonsConfigure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dbService.getVisits(patient: patient!) {
            DispatchQueue.main.async {
                self.customView.visitTableView.reloadData()
            }
        }
    }
    
    //MARK:- Private Methods
    
    private func barButtonsConfigure() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .large)), style: .plain, target: self, action: #selector(addVisit))
        navButtons.append(addButton)
        let changeButton = UIBarButtonItem(image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .large)), style: .plain, target: self, action: #selector(changeInfo))
        navButtons.append(changeButton)
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "checkmark.rectangle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .large)), style: .plain, target: self, action: #selector(saveChanges))
        saveButton.isEnabled = false
        navButtons.append(saveButton)
        self.navigationItem.rightBarButtonItems = navButtons
    }
    
    @objc private func addVisit() {
        let addVisitViewController = AddVisitViewController()
        addVisitViewController.patient = patient
        addVisitViewController.modalPresentationStyle = .fullScreen
        present(addVisitViewController, animated: true, completion: nil)
    }
    
    @objc private func changeInfo() {
        navigationItem.rightBarButtonItems![2].isEnabled = true
        
        customView.surname.isUserInteractionEnabled = true
        customView.surname.borderStyle = .roundedRect
        customView.name.isUserInteractionEnabled = true
        customView.name.borderStyle = .roundedRect
        customView.patronymic.isUserInteractionEnabled = true
        customView.patronymic.borderStyle = .roundedRect
        customView.birthday.isUserInteractionEnabled = true
        customView.birthday.borderStyle = .roundedRect
        customView.phone.isUserInteractionEnabled = true
        customView.phone.borderStyle = .roundedRect
        customView.email.isUserInteractionEnabled = true
        customView.email.borderStyle = .roundedRect
    }
    
    @objc private func saveChanges() {
        navigationItem.rightBarButtonItems![2].isEnabled = false
        
        guard let docId = patient?.docId,
              let cardNumber = patient?.cardNumber,
              let surname = customView.surname.text,
              let name = customView.name.text,
              let patronymic = customView.patronymic.text,
              let birthday = customView.birthday.text,
              let phone = customView.phone.text,
              let email = customView.email.text else {
            return
        }
        
        let newInfoPatient = Patient(docId: docId,
                                     cardNumber: cardNumber,
                                     surname: surname,
                                     name: name,
                                     patronymic: patronymic,
                                     dateOfBirth: birthday,
                                     phoneNumber: phone,
                                     email: email)
        
        dbService.addPatient(patientDict: newInfoPatient.dictionary, patient: newInfoPatient) { [self] success in
            if success {
                print("OK")
                self.changeInfo()
                self.customView.surname.isUserInteractionEnabled = false
                self.customView.surname.borderStyle = .none
                self.customView.name.isUserInteractionEnabled = false
                self.customView.name.borderStyle = .none
                self.customView.patronymic.isUserInteractionEnabled = false
                self.customView.patronymic.borderStyle = .none
                self.customView.birthday.isUserInteractionEnabled = false
                self.customView.birthday.borderStyle = .none
                self.customView.phone.isUserInteractionEnabled = false
                self.customView.phone.borderStyle = .none
                self.customView.email.isUserInteractionEnabled = false
                self.customView.email.borderStyle = .none
                
            } else {
                print("ERROR")
            }
        }
    }
    
    private func setup() {
        navigationItem.title = "№\(patient!.cardNumber)"
        
        customView.surname.text = patient?.surname
        customView.name.text = patient?.name
        customView.patronymic.text = patient?.patronymic
        customView.birthday.text = patient?.dateOfBirth
        customView.age.text = calcAge(birthday: patient!.dateOfBirth)
        customView.phone.text = patient?.phoneNumber
        customView.email.text = patient?.email
        
        customView.visitTableView.dataSource = self
        customView.visitTableView.delegate = self
        
        customView.imagesCollectionView.dataSource = self
        customView.imagesCollectionView.delegate = self
        
        customView.visitTableView.register(VisitTableViewCell.self, forCellReuseIdentifier: VisitTableViewCell.reuseIdentifier)
        
        customView.addPhotoButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
    }
    
    private func calcAge(birthday: String) -> String! {
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

//MARK:- UITableViewDataSource & UITableViewDelegate

extension PatientDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dbService.visitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VisitTableViewCell.reuseIdentifier, for: indexPath) as? VisitTableViewCell else {
            
            return UITableViewCell()
        }
        let visit = dbService.visitsArray[indexPath.row]
        
        cell.configure(visitModel: visit)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let visitVC = VisitViewController()
        let patient = patient
        let visit = dbService.visitsArray[indexPath.row]
        visitVC.patient = patient
        visitVC.visit = visit
        self.navigationController?.pushViewController(visitVC, animated: true)
    }

}

//MARK:- UICollectionViewDelegate & UICollectionViewDataSource

extension PatientDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.reuseIdentifier, for: indexPath) as? ImagesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let image = imagesArray[indexPath.row]
        
        cell.configure(image: image!)
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        
        return cell
    }
    
}

extension PatientDetailsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc private func addPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

