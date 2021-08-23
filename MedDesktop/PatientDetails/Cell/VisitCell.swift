//
//  VisitCell.swift
//  MedDesktop
//
//  Created by Igor Ogai on 04.08.2021.
//

import UIKit

class VisitCell: UITableViewCell {
    
    //MARK:- Public Properties
    
    static let cell = "visitCell"
    
    //MARK:-  Private Properties
    
    private lazy var procedureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Public Methods
    
    func configure(visitModel: Visit) {
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        
        procedureLabel.text = visitModel.procedureName
        dateLabel.text = visitModel.date
    }

    //MARK:- Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: VisitCell.cell)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        contentView.addSubview(procedureLabel)
        contentView.addSubview(dateLabel)
        
        procedureLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            procedureLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            procedureLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            procedureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dateLabel.leftAnchor.constraint(equalTo: procedureLabel.rightAnchor, constant: -16),
            dateLabel.centerYAnchor.constraint(equalTo: procedureLabel.centerYAnchor),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
}
