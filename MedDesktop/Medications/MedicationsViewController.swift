//
//  MedicationsViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 09.09.2021.
//

import UIKit

class MedicationsViewController: UIViewController {
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! MedicationsView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = MedicationsView()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK:- Private methods
    
    private func configureView() {
        customView.medicationsTextView.text = """
        Ибуклин 1 таблетка в день
        Аскорутин 1 раз в день после еды
        Лозап плюс 25мг/утром
        Лозап 25мг/ночью
        Пиковит
        Ибуклин 1 таблетка в день
        Аскорутин 1 раз в день после еды
        Лозап плюс 25мг/утром
        Лозап 25мг/ночью
        Пиковит
        Ибуклин 1 таблетка в день
        Аскорутин 1 раз в день после еды
        Лозап плюс 25мг/утром
        Лозап 25мг/ночью
        Пиковит
        """
    }
}
