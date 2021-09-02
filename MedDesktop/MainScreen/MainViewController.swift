//
//  MainViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 05.07.2021.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    //MARK:- Public Properties
    
    var dbService: DatabaseService!
    
    //MARK:- Private Properties
    
    private(set) lazy var customView = view as! MainView
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var patients = [Patient]()
    private var filteredPatients = [Patient]()
    private var isSearchIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchIsEmpty
    }
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = MainView()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Пациенты"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbService = DatabaseService()
        configure()
        dbService.getPatients {
            DispatchQueue.main.async {
                self.customView.tableView.reloadData()
            }
        }
    }
    
    //MARK:- Private Methods
    
    private func configure() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        barButtonsConfigure()
        searchBarSetup()
    }
    
    private func barButtonsConfigure() {
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        addButton.setBackgroundImage(UIImage(systemName: "doc.badge.plus"), for: .normal)
        addButton.addTarget(self, action: #selector(addPatient), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        let logOutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        logOutButton.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.left"), for: .normal)
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logOutButton)
    }
    
    @objc private func addPatient() {
        let addPatientViewController = AddPatientViewController()
        self.present(addPatientViewController, animated: true, completion: nil)
    }
    
    @objc private func logOut() {
        do {
            try Auth.auth().signOut()
            
            let authVC = AuthenticationViewController()
            authVC.modalPresentationStyle = .fullScreen
            present(authVC, animated: true, completion: nil)
        } catch {
            
        }
    }
    
    private func searchBarSetup() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск по фамилии или имени"
        definesPresentationContext = true
    }
}

//MARK:- UITableViewDelegate & UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredPatients.count
        }
        
        return dbService.patientArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model: Patient
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PatientCell.reuseIdentifier, for: indexPath) as? PatientCell else { return UITableViewCell() }
        
        if isFiltering {
            model = filteredPatients[indexPath.row]
            cell.configure(patientModel: model)
        } else {
            model = dbService.patientArray[indexPath.row]
            cell.configure(patientModel: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let patientDetailsVC = PatientDetailsViewController()
        var model: Patient
        if isFiltering {
            model = filteredPatients[indexPath.row]
            patientDetailsVC.patient = model
        } else {
            model = dbService.patientArray[indexPath.row]
            patientDetailsVC.patient = model
        }
        
        self.navigationController?.pushViewController(patientDetailsVC, animated: true)
    }
    
}

//MARK:- UISearchBarDelegate & UISearchResultsUpdating

extension MainViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text!
        
        filterForSearch(searhText: searchText)
    }
    
    private func filterForSearch(searhText: String) {
        filteredPatients = dbService.patientArray.filter { patient in
            let fullName = patient.surname + " " + patient.name
            let match = fullName.lowercased()
            return match.contains(searhText.lowercased())
        }
        customView.tableView.reloadData()
    }
    
}
