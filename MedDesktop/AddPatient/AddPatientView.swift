//
//  AddPatientView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 09.07.2021.
//

import UIKit

class AddPatientView: UIView {
    
    //MARK:- Private Properties
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    private(set) lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "Фамилия"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "Имя"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var patronymicTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "Отчество (если имеется)"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var dateOfBirthTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "Дата рождения"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.keyboardType = .phonePad
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "Номер телефона (если имеется)"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 15
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "E-mail (если имеется)"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var alertLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private(set) lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button.layer.cornerRadius = 35
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        addSubview(stackView)
        addSubview(alertLabel)
        addSubview(addButton)
        
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(patronymicTextField)
        stackView.addArrangedSubview(dateOfBirthTextField)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.addArrangedSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            alertLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            alertLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            alertLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.topAnchor.constraint(greaterThanOrEqualTo: alertLabel.bottomAnchor, constant: 16),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 300),
            addButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.dateOfBirthTextField.datePicker(target: self, doneAction: #selector(doneAction), cancelAction: #selector(cancelAction), datePickerMode: .date)
    }
    
    //MARK:- DatePickerView
    
    @objc private func cancelAction() {
        self.dateOfBirthTextField.resignFirstResponder()
    }
    
    @objc private func doneAction() {
        if let datePickerView = self.dateOfBirthTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.dateOfBirthTextField.text = dateString
            
            self.dateOfBirthTextField.resignFirstResponder()
        }
    }
}

//MARK:- DatePickerView extension

extension UITextField {
    func datePicker<T>(target: T,
                       doneAction: Selector,
                       cancelAction: Selector,
                       datePickerMode: UIDatePicker.Mode = .date) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                target: buttonTarget,
                                                action: action)
            
            return barButtonItem
        }
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 300))
        datePicker.datePickerMode = datePickerMode
        self.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                          buttonItem(withSystemItemStyle: .flexibleSpace),
                          buttonItem(withSystemItemStyle: .done)],
                         animated: true)
        self.inputAccessoryView = toolBar
    }
}
