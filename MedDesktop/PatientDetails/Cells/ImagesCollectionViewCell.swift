//
//  ImagesCollectionViewCell.swift
//  MedDesktop
//
//  Created by Igor Ogai on 10.09.2021.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Public Properties
    
    static let reuseIdentifier = "imageCollectionViewCell"
    
    //MARK:-  Private Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK:- Public Methods
    
    func configure(image: UIImage) {
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        imageView.image = image
    }
    
    //MARK:- Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    
    private func setup() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
