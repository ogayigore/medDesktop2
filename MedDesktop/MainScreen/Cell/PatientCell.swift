//
//  PatientCell.swift
//  MedDesktop
//
//  Created by Igor Ogai on 09.07.2021.
//

import UIKit

class PatientCell: UITableViewCell {
    
    //MARK:- Public Properties
    
    static var reuseIdentifier = "patientCell"
    
    //MARK:- Private Properties
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
//        label.backgroundColor = .blue
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
//        label.backgroundColor = .red
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cardNumberLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .green
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Public Methods
    
    func configure(patientModel: Patient) {
        
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        guard let patientPatronymic = patientModel.patronymic else { return }
        
        fullNameLabel.text = "\(patientModel.surname + " " + patientModel.name + " " + patientPatronymic)"
        dateOfBirthLabel.text = patientModel.dateOfBirth
        ageLabel.text = calcAge(birthday: patientModel.dateOfBirth)
        cardNumberLabel.text = String(patientModel.cardNumber)
    }
    
    //MARK:- Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PatientCell.reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(dateOfBirthLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(cardNumberLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            fullNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dateOfBirthLabel.leftAnchor.constraint(equalTo: fullNameLabel.rightAnchor, constant: 8),
            dateOfBirthLabel.centerYAnchor.constraint(equalTo: fullNameLabel.centerYAnchor),
            dateOfBirthLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 160),
            dateOfBirthLabel.rightAnchor.constraint(equalTo: ageLabel.leftAnchor, constant: -8),
            ageLabel.rightAnchor.constraint(equalTo: cardNumberLabel.leftAnchor, constant: -8),
            ageLabel.centerYAnchor.constraint(equalTo: cardNumberLabel.centerYAnchor),
            ageLabel.widthAnchor.constraint(equalToConstant: 150),
            cardNumberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            cardNumberLabel.centerYAnchor.constraint(equalTo: fullNameLabel.centerYAnchor),
            cardNumberLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
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
