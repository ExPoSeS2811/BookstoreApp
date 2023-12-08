//
//  CustomListView.swift
//  BookstoreApp
//
//  Created by Nikita on 08.12.2023.
//

import UIKit

final class CustomListView: UIView {
    
    //MARK: - UI elements
    
    let textLabel = UILabel()
    let selectButton = UIButton()
    
    //MARK: - Initialize
    
    init(text: String, font: UIFont, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.textLabel.text = text
        self.layer.cornerRadius = cornerRadius
        
        // Call function's
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        // Setup gray view
        self.backgroundColor = .lightGray
        self.addSubviews(textLabel, selectButton)
        
        // Setup select button
        selectButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        selectButton.tintColor = .black
    }
}

//MARK: - Extension

extension CustomListView {
    
    /// Numbers for constraints
    private enum Constants {
        static let tenPoints: CGFloat = 10
        static let sixtyPoints: CGFloat = 60
    }
    
    /// Setup constraints for ui elements
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            // Text label
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.tenPoints),
            
            // Select button
            selectButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            selectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.tenPoints),
            selectButton.heightAnchor.constraint(equalToConstant: Constants.sixtyPoints),
            selectButton.widthAnchor.constraint(equalToConstant: Constants.sixtyPoints)
        ])
    }
}
