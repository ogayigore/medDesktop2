//
//  PatientDetailsView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 28.07.2021.
//

import UIKit

class PatientDetailsView: UIView {
    
    //MARK:- Private Properties
    
    private lazy var patientView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private(set) lazy var surname: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var name: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var patronymic: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var birthday: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var age: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var phone: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var email: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.adjustsFontSizeToFitWidth = true
        textField.borderStyle = .none
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var addPhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "camera", withConfiguration: UIImage.SymbolConfiguration(pointSize: 100, weight: .light, scale: .small)), for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private(set) lazy var imagesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: ImagesCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private(set) lazy var visitTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PatientCell.self, forCellReuseIdentifier: PatientCell.reuseIdentifier)
        tableView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        tableView.tableHeaderView?.backgroundColor = .white
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
        
        patientView.addSubview(surnameLabel)
        patientView.addSubview(nameLabel)
        patientView.addSubview(patronymicLabel)
        patientView.addSubview(birthdayLabel)
        patientView.addSubview(ageLabel)
        patientView.addSubview(phoneLabel)
        patientView.addSubview(emailLabel)
        patientView.addSubview(surname)
        patientView.addSubview(name)
        patientView.addSubview(patronymic)
        patientView.addSubview(birthday)
        patientView.addSubview(age)
        patientView.addSubview(phone)
        patientView.addSubview(email)
        patientView.addSubview(addPhotoButton)
        patientView.addSubview(imagesCollectionView)
        addSubview(visitTableView)
        visitTableView.tableHeaderView = patientView
        
        NSLayoutConstraint.activate([
            visitTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            visitTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            visitTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            visitTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            patientView.widthAnchor.constraint(equalTo: visitTableView.widthAnchor),
            surnameLabel.leftAnchor.constraint(equalTo: patientView.leftAnchor, constant: 16),
            surnameLabel.topAnchor.constraint(equalTo: patientView.topAnchor, constant: 8),
            surnameLabel.widthAnchor.constraint(equalToConstant: 350),
            surname.leftAnchor.constraint(equalTo: surnameLabel.rightAnchor, constant: 8),
            surname.rightAnchor.constraint(equalTo: patientView.rightAnchor, constant: -16),
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
            addPhotoButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            addPhotoButton.leftAnchor.constraint(equalTo: emailLabel.leftAnchor),
            addPhotoButton.bottomAnchor.constraint(equalTo: patientView.bottomAnchor, constant: -8),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 150),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 150),
            imagesCollectionView.leftAnchor.constraint(equalTo: addPhotoButton.rightAnchor, constant: 8),
            imagesCollectionView.centerYAnchor.constraint(equalTo: addPhotoButton.centerYAnchor),
            imagesCollectionView.rightAnchor.constraint(equalTo: email.rightAnchor),
            imagesCollectionView.heightAnchor.constraint(equalTo: addPhotoButton.heightAnchor)
            
        ])
        
        self.birthday.datePicker(target: self, doneAction: #selector(doneAction), cancelAction: #selector(cancelAction), datePickerMode: .date)
    }
    
    //MARK:- DatePickerView
    
    @objc private func cancelAction() {
        self.birthday.resignFirstResponder()
    }
    
    @objc private func doneAction() {
        if let datePickerView = self.birthday.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.birthday.text = dateString
            
            self.birthday.resignFirstResponder()
        }
    }
}
