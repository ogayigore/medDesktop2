//
//  PrintVisitViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 12.08.2021.
//

import UIKit

class PrintVisitViewController: UIViewController {
    
    //MARK:- Public Properties
    
    var dbService: DatabaseService?
    var visit: Visit!
    var patient: Patient!
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! PrintVisitView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = PrintVisitView()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbService = DatabaseService()
        configureView()
    }
    
    //MARK:- Private methods
    
    private func configureView() {
        customView.webView.loadHTMLString("<html><b>\(patient.surname)<b><br> <i>\(patient.name)</i><br><p>text</p>&#36;<br><p>eeded</p>ede<span>&#42; <img src='https://b1.filmpro.ru/c/444776.700xp.jpg'/></span>  </html>", baseURL: nil)
        customView.printButton.addTarget(self, action: #selector(printButtonTapped), for: .touchUpInside)
    }
    
    

    @objc private func printButtonTapped() {
        goToPrint()
    }
    
    private func goToPrint() {
        
        let printInfo: UIPrintInfo = UIPrintInfo.printInfo()
        printInfo.outputType = .general
        printInfo.jobName = (customView.webView.request?.url!.absoluteString)!
        printInfo.orientation = .portrait
        
        let printController = UIPrintInteractionController.shared
        printController.printInfo = printInfo
        printController.printFormatter = customView.webView.viewPrintFormatter()
        printController.present(animated: true, completionHandler: nil)
        
    }
}
