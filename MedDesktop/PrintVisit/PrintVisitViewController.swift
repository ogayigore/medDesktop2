//
//  PrintVisitViewController.swift
//  MedDesktop
//
//  Created by Igor Ogai on 12.08.2021.
//

import UIKit
import Firebase

class PrintVisitViewController: UIViewController {
    
    //MARK:- Public Properties
    
    var html: HTMLFile?
    var visit: Visit!
    var patient: Patient!
    var saved = 0
    
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
        html = HTMLFile()
        configureView()
    }
    
    //MARK:- Private methods
    
    private func configureView() {
        let htmlString = html!.getHtmlPage(patient: patient, visit: visit)
        customView.webView.loadHTMLString(htmlString, baseURL: nil)
        customView.printButton.addTarget(self, action: #selector(printButtonTapped), for: .touchUpInside)
        customView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func printButtonTapped() {
        goToPrint()
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
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
        
        if saved == 0 {
            saved += 1
            visit.saveData(patient: patient) { [weak self] success in
                if success {
                    print("Success saveData()")
                } else {
                    print("Error saveData()")
                }
            }
        }
                
    }
}
