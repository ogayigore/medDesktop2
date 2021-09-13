//
//  Mkb10View.swift
//  MedDesktop
//
//  Created by Igor Ogai on 13.09.2021.
//

import UIKit
import WebKit

class Mkb10View: UIView {
    
    //MARK:- Private Properties
    
    private(set) lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.backgroundColor = .white
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
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
        
        addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: topAnchor),
            webView.leftAnchor.constraint(equalTo: leftAnchor),
            webView.rightAnchor.constraint(equalTo: rightAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
