//
//  CustomCollectionCell.swift
//  LessonThree
//
//  Created by Илья Зорин on 17.09.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CustomCollectionCell"
    
    let containerView = UIView()
    
    lazy var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.systemBlue
        return imageView
    }()
    
    lazy var customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.addSubview(customImageView)
        containerView.addSubview(customLabel)
        configureConstraints()
        
        containerView.backgroundColor = UIColor.systemGray6
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 1
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage) {
        customImageView.image = image
    }
    
    private func configureConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            
            customImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            customImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 30),
            customImageView.heightAnchor.constraint(equalToConstant: 30),
            
            
            customLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
            customLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            customLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
}
