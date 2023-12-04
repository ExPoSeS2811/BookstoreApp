//
//  ScreenProductViewController.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

class ScreenProductViewController: UIViewController {

    //MARK: - UI Elements
    
    private lazy var bookNameLabel: UILabel = {
        let label = UILabel()
        label.text = "The Picture of Dorian Gray"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var bookPicture: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function's
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubviews(bookNameLabel, bookPicture)
        bookPicture.dropShadow()
    }
}

//MARK: - Extension

extension ScreenProductViewController {
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Book name label
            bookNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 76),
            bookNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            bookNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20),
            bookNameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            // Book picture
            bookPicture.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 16),
            bookPicture.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 19),
            bookPicture.heightAnchor.constraint(equalToConstant: 214),
            bookPicture.widthAnchor.constraint(equalToConstant: 138),
        ])
    }
}

#Preview() {
    ScreenProductViewController()
}
