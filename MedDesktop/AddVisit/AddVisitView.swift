//
//  AddVisitView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 05.08.2021.
//

import UIKit

class AddVisitView: UIView {
    
    //MARK:- Private Properties
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.backgroundColor = .lightGray
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private(set) lazy var procedureTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.placeholder = "Название процедуры"
        textField.textColor = .black
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 28)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private(set) lazy var complaintLabel: UILabel = {
        let label = UILabel()
        label.text = "Жалобы:"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var complaintTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var anamnesisLabel: UILabel = {
        let label = UILabel()
        label.text = "Анамнез:"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var anamnesisTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Статус:"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var statusTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var diagnosisLabel: UILabel = {
        let label = UILabel()
        label.text = "Диагноз:"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var diagnosisTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var appointmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Назначение:"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var appointmentTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var recomendationLabel: UILabel = {
        let label = UILabel()
        label.text = "Рекомендации:"
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var recomendationTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var formButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сформировать", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button.layer.cornerRadius = 30
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
        
        addSubview(scrollView)
        scrollView.addSubview(procedureTextField)
        scrollView.addSubview(complaintLabel)
        scrollView.addSubview(complaintTextView)
        scrollView.addSubview(anamnesisLabel)
        scrollView.addSubview(anamnesisTextView)
        scrollView.addSubview(statusLabel)
        scrollView.addSubview(statusTextView)
        scrollView.addSubview(diagnosisLabel)
        scrollView.addSubview(diagnosisTextView)
        scrollView.addSubview(appointmentLabel)
        scrollView.addSubview(appointmentTextView)
        scrollView.addSubview(recomendationLabel)
        scrollView.addSubview(recomendationTextView)
        scrollView.addSubview(formButton)
        scrollView.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            procedureTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            procedureTextField.widthAnchor.constraint(equalToConstant: 800),
            procedureTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            procedureTextField.heightAnchor.constraint(equalToConstant: 50),
            complaintLabel.topAnchor.constraint(equalTo: procedureTextField.bottomAnchor, constant: 16),
            complaintLabel.leftAnchor.constraint(equalTo: procedureTextField.leftAnchor),
            complaintTextView.topAnchor.constraint(equalTo: complaintLabel.bottomAnchor, constant: 8),
            complaintTextView.leftAnchor.constraint(equalTo: complaintLabel.leftAnchor),
            complaintTextView.rightAnchor.constraint(equalTo: procedureTextField.rightAnchor),
            complaintTextView.heightAnchor.constraint(equalToConstant: 300),
            anamnesisLabel.topAnchor.constraint(equalTo: complaintTextView.bottomAnchor, constant: 16),
            anamnesisLabel.leftAnchor.constraint(equalTo: complaintTextView.leftAnchor),
            anamnesisTextView.topAnchor.constraint(equalTo: anamnesisLabel.bottomAnchor, constant: 8),
            anamnesisTextView.leftAnchor.constraint(equalTo: anamnesisLabel.leftAnchor),
            anamnesisTextView.rightAnchor.constraint(equalTo: complaintTextView.rightAnchor),
            anamnesisTextView.heightAnchor.constraint(equalToConstant: 300),
            statusLabel.topAnchor.constraint(equalTo: anamnesisTextView.bottomAnchor, constant: 16),
            statusLabel.leftAnchor.constraint(equalTo: anamnesisTextView.leftAnchor),
            statusTextView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextView.leftAnchor.constraint(equalTo: statusLabel.leftAnchor),
            statusTextView.rightAnchor.constraint(equalTo: anamnesisTextView.rightAnchor),
            statusTextView.heightAnchor.constraint(equalToConstant: 300),
            diagnosisLabel.topAnchor.constraint(equalTo: statusTextView.bottomAnchor, constant: 16),
            diagnosisLabel.leftAnchor.constraint(equalTo: statusTextView.leftAnchor),
            diagnosisTextView.topAnchor.constraint(equalTo: diagnosisLabel.bottomAnchor, constant: 8),
            diagnosisTextView.leftAnchor.constraint(equalTo: diagnosisLabel.leftAnchor),
            diagnosisTextView.rightAnchor.constraint(equalTo: statusTextView.rightAnchor),
            diagnosisTextView.heightAnchor.constraint(equalToConstant: 300),
            appointmentLabel.topAnchor.constraint(equalTo: diagnosisTextView.bottomAnchor, constant: 16),
            appointmentLabel.leftAnchor.constraint(equalTo: diagnosisTextView.leftAnchor),
            appointmentTextView.topAnchor.constraint(equalTo: appointmentLabel.bottomAnchor, constant: 8),
            appointmentTextView.leftAnchor.constraint(equalTo: appointmentLabel.leftAnchor),
            appointmentTextView.rightAnchor.constraint(equalTo: diagnosisTextView.rightAnchor),
            appointmentTextView.heightAnchor.constraint(equalToConstant: 300),
            recomendationLabel.topAnchor.constraint(equalTo: appointmentTextView.bottomAnchor, constant: 16),
            recomendationLabel.leftAnchor.constraint(equalTo: appointmentTextView.leftAnchor),
            recomendationTextView.topAnchor.constraint(equalTo: recomendationLabel.bottomAnchor, constant: 8),
            recomendationTextView.leftAnchor.constraint(equalTo: recomendationLabel.leftAnchor),
            recomendationTextView.rightAnchor.constraint(equalTo: appointmentTextView.rightAnchor),
            recomendationTextView.heightAnchor.constraint(equalToConstant: 300),
            formButton.topAnchor.constraint(equalTo: recomendationTextView.bottomAnchor, constant: 16),
            formButton.rightAnchor.constraint(equalTo: recomendationTextView.rightAnchor),
            formButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8),
            formButton.heightAnchor.constraint(equalToConstant: 60),
            formButton.widthAnchor.constraint(equalToConstant: 270),
            cancelButton.centerYAnchor.constraint(equalTo: formButton.centerYAnchor),
            cancelButton.heightAnchor.constraint(equalTo: formButton.heightAnchor),
            cancelButton.widthAnchor.constraint(equalTo: formButton.widthAnchor),
            cancelButton.leftAnchor.constraint(equalTo: recomendationTextView.leftAnchor)
        ])
        
    }
    
}


