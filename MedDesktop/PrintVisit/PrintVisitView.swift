//
//  PrintVisitView.swift
//  MedDesktop
//
//  Created by Igor Ogai on 12.08.2021.
//

import UIKit
import WebKit

class PrintVisitView: UIView {
    
    //MARK:- Private Properties
    
    private(set) lazy var printTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private(set) lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = .white
        webView.layer.borderWidth = 1
        webView.layer.borderColor = UIColor.black.cgColor
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private(set) lazy var printButton: UIButton = {
        let button = UIButton()
        button.setTitle("Печать", for: .normal)
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
        
//        addSubview(printTextView)
        addSubview(webView)
        addSubview(printButton)
        addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
//            printTextView.topAnchor.constraint(equalTo: topAnchor, constant: 64),
//            printTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            printTextView.widthAnchor.constraint(equalToConstant: 800),
//            printButton.topAnchor.constraint(equalTo: printTextView.bottomAnchor, constant: 16),
            webView.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            webView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            webView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            printButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 16),
            printButton.rightAnchor.constraint(equalTo: webView.rightAnchor),
            printButton.widthAnchor.constraint(equalToConstant: 270),
            printButton.heightAnchor.constraint(equalToConstant: 60),
            printButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            cancelButton.centerYAnchor.constraint(equalTo: printButton.centerYAnchor),
            cancelButton.heightAnchor.constraint(equalTo: printButton.heightAnchor),
            cancelButton.widthAnchor.constraint(equalTo: printButton.widthAnchor),
            cancelButton.leftAnchor.constraint(equalTo: webView.leftAnchor)
        ])
        
    }
}
