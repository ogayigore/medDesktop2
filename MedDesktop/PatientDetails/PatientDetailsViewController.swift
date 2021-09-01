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
    
    //MARK:- Public Properties
    
    var dbService: DatabaseService!
    var patient: Patient?
    
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
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        addButton.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        addButton.addTarget(self, action: #selector(addVisit), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    @objc private func addVisit() {
        let addVisitViewController = AddVisitViewController()
        addVisitViewController.patient = patient
        addVisitViewController.modalPresentationStyle = .fullScreen
        present(addVisitViewController, animated: true, completion: nil)
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
        
        customView.visitTableView.register(VisitCell.self, forCellReuseIdentifier: VisitCell.reuseIdentifier)
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VisitCell.reuseIdentifier, for: indexPath) as? VisitCell else {
            print("ОБОСРАМС")
            return UITableViewCell()
        }
        let visit = dbService.visitsArray[indexPath.row]
        
        cell.configure(visitModel: visit)
        
        return cell
    }

}
