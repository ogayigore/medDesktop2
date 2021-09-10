//
//  MedicationsView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 09.09.2021.
//

import UIKit

class MedicationsView: UIView {
    
    //MARK:- Private Properties
    
    private(set) lazy var medicationsTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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
        
        addSubview(medicationsTextView)
        
        NSLayoutConstraint.activate([
            medicationsTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            medicationsTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            medicationsTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            medicationsTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
    }
}

