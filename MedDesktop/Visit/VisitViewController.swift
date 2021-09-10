//
//  VisitViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 06.09.2021.
//

import UIKit
import Firebase

class VisitViewController: UIViewController {
    
    //MARK:- Public Properties
    
    var html: HTMLFile?
    var visit: Visit!
    var patient: Patient!
    
    //MARK:- Private Properties
    
    private lazy var customView = view as! VisitView
    
    //MARK:- Lifecycle
    
    override func loadView() {
        view = VisitView()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        html = HTMLFile()
        configureView()
    }
    
    //MARK:- Private methods
    
    private func configureView() {
        let htmlString = html!.getHtmlPage(patient: patient, visit: visit)
        customView.webView.loadHTMLString(htmlString, baseURL: nil)
        customView.printButton.addTarget(self, action: #selector(printButtonTapped), for: .touchUpInside)
    }
    
    @objc private func printButtonTapped() {
        goToPrint()
    }
    
    private func goToPrint() {
       
        let printInfo: UIPrintInfo = UIPrintInfo.printInfo()
        printInfo.outputType = .general
        printInfo.jobName = self.html!.getHtmlPage(patient: self.patient, visit: self.visit)
        printInfo.orientation = .portrait
        
        let printController = UIPrintInteractionController.shared
        printController.printInfo = printInfo
        printController.printFormatter = self.customView.webView.viewPrintFormatter()
        
        DispatchQueue.main.async {
            printController.present(animated: true, completionHandler: nil)
        }
        
    }
}
