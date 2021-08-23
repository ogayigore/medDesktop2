//
//  MainView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 05.07.2021.
//

import UIKit

class MainView: UIView {
    
    //MARK:- Private Properties
    
    private lazy var fullNameHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "ФИО пациента"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateOfBirthHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardNumberHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "№"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PatientCell.self, forCellReuseIdentifier: PatientCell.cell)
        tableView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return tableView
    }()
    
    //MARK:- Initializers
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        backgroundColor = .white
        tableView.keyboardDismissMode = .onDrag
        
        addSubview(fullNameHeaderLabel)
        addSubview(dateOfBirthHeaderLabel)
        addSubview(ageHeaderLabel)
        addSubview(cardNumberHeaderLabel)
        addSubview(tableView)
        
        fullNameHeaderLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        dateOfBirthHeaderLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            fullNameHeaderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            fullNameHeaderLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dateOfBirthHeaderLabel.centerYAnchor.constraint(equalTo: fullNameHeaderLabel.centerYAnchor),
            dateOfBirthHeaderLabel.leftAnchor.constraint(equalTo: fullNameHeaderLabel.rightAnchor, constant: 8),
            ageHeaderLabel.centerYAnchor.constraint(equalTo: dateOfBirthHeaderLabel.centerYAnchor),
            ageHeaderLabel.leftAnchor.constraint(equalTo: dateOfBirthHeaderLabel.rightAnchor, constant: 8),
            ageHeaderLabel.widthAnchor.constraint(equalToConstant: 150),
            cardNumberHeaderLabel.leftAnchor.constraint(equalTo: ageHeaderLabel.rightAnchor, constant: 8),
            cardNumberHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            cardNumberHeaderLabel.centerYAnchor.constraint(equalTo: fullNameHeaderLabel.centerYAnchor),
            cardNumberHeaderLabel.widthAnchor.constraint(equalToConstant: 100),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.topAnchor.constraint(equalTo: fullNameHeaderLabel.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
