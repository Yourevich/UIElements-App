//
//  CustomCell.swift
//  LessonThree
//
//  Created by Илья Зорин on 08.09.2023.
//
import UIKit

class CustomCell: UITableViewCell {
    static let reuseIdentifier = "CustomCell"
    
    let customStackView = UIStackView()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(customStackView)
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage) {
        customImageView.image = image
    }
    
    private func configureStackView() {
        customStackView.translatesAutoresizingMaskIntoConstraints = false
        customStackView.addArrangedSubview(customImageView)
        customStackView.addArrangedSubview(customLabel)
        
        customStackView.axis = .horizontal
        customStackView.alignment = .center
        customStackView.spacing = 20
        
        NSLayoutConstraint.activate([
            customStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            customStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 30),
            customImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
