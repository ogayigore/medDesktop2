//
//  PatientDetailsView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 28.07.2021.
//

import UIKit

class PatientDetailsView: UIView {
    
    //MARK:- Private Properties
    
    private lazy var surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var patronymicLabel: UILabel = {
        let label = UILabel()
        label.text = "Отчество:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Электронная почта:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var surname: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var patronymic: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var birthday: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var age: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var phone: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var email: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var visitTableView: UITableView = {
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
        
        addSubview(surnameLabel)
        addSubview(nameLabel)
        addSubview(patronymicLabel)
        addSubview(birthdayLabel)
        addSubview(ageLabel)
        addSubview(phoneLabel)
        addSubview(emailLabel)
        addSubview(surname)
        addSubview(name)
        addSubview(patronymic)
        addSubview(birthday)
        addSubview(age)
        addSubview(phone)
        addSubview(email)
        addSubview(visitTableView)
        
//        surnameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        name.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        name.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        patronymicLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        patronymic.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        birthdayLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        birthday.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        ageLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        age.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        phoneLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        phone.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        NSLayoutConstraint.activate([
            surnameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            surnameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            surnameLabel.widthAnchor.constraint(equalToConstant: 350),
            surname.leftAnchor.constraint(equalTo: surnameLabel.rightAnchor, constant: 8),
            surname.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            surname.centerYAnchor.constraint(equalTo: surnameLabel.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: surnameLabel.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 350),
            name.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 8),
            name.rightAnchor.constraint(equalTo: surname.rightAnchor),
            name.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            patronymicLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            patronymicLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            patronymicLabel.widthAnchor.constraint(equalToConstant: 350),
            patronymic.leftAnchor.constraint(equalTo: patronymicLabel.rightAnchor, constant: 8),
            patronymic.rightAnchor.constraint(equalTo: name.rightAnchor),
            patronymic.centerYAnchor.constraint(equalTo: patronymicLabel.centerYAnchor),
            birthdayLabel.leftAnchor.constraint(equalTo: patronymicLabel.leftAnchor),
            birthdayLabel.topAnchor.constraint(equalTo: patronymicLabel.bottomAnchor, constant: 16),
            birthdayLabel.widthAnchor.constraint(equalToConstant: 350),
            birthday.leftAnchor.constraint(equalTo: birthdayLabel.rightAnchor, constant: 8),
            birthday.rightAnchor.constraint(equalTo: patronymic.rightAnchor),
            birthday.centerYAnchor.constraint(equalTo: birthdayLabel.centerYAnchor),
            ageLabel.leftAnchor.constraint(equalTo: birthdayLabel.leftAnchor),
            ageLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 16),
            ageLabel.widthAnchor.constraint(equalToConstant: 350),
            age.leftAnchor.constraint(equalTo: ageLabel.rightAnchor, constant: 8),
            age.rightAnchor.constraint(equalTo: birthday.rightAnchor),
            age.centerYAnchor.constraint(equalTo: ageLabel.centerYAnchor),
            phoneLabel.leftAnchor.constraint(equalTo: ageLabel.leftAnchor),
            phoneLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 16),
            phoneLabel.widthAnchor.constraint(equalToConstant: 350),
            phone.leftAnchor.constraint(equalTo: phoneLabel.rightAnchor, constant: 8),
            phone.rightAnchor.constraint(equalTo: age.rightAnchor),
            phone.centerYAnchor.constraint(equalTo: phoneLabel.centerYAnchor),
            emailLabel.leftAnchor.constraint(equalTo: phoneLabel.leftAnchor),
            emailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 16),
            emailLabel.widthAnchor.constraint(equalToConstant: 350),
            email.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 8),
            email.rightAnchor.constraint(equalTo: phone.rightAnchor),
            email.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            visitTableView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            visitTableView.leftAnchor.constraint(equalTo: emailLabel.leftAnchor),
            visitTableView.rightAnchor.constraint(equalTo: email.rightAnchor),
            visitTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}