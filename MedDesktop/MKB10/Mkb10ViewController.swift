//
//  Mkb10ViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 13.09.2021.
//

import UIKit
import WebKit

class Mkb10ViewController: UIViewController, WKNavigationDelegate {
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! Mkb10View
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = Mkb10View()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK:- Private methods
    
    private func configureView() {
        let url = URL(string: "https://mkb-10.com/")!
        customView.webView.load(URLRequest(url: url))
//        customView.webView.allowsBackForwardNavigationGestures = true
        
        customView.webView.navigationDelegate = self
    }
}
