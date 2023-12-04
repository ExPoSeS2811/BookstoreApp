//
//  ScreenProductViewController.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

class ScreenProductViewController: UIViewController {

    //MARK: - UI Elements

    private lazy var bookNameLabel = UILabel(text: "The Picture of Dorian Gray", font: .boldSystemFont(ofSize: 24), textColor: .black)
    private lazy var bookPicture: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        return image
    }()
    
    private lazy var bookInformationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    private lazy var authorLabel = UILabel(text: "Author : Oscar Wilde", font: .systemFont(ofSize: 14), textColor: .black)
    private lazy var categoryLable = UILabel(text: "Category : Classics", font: .systemFont(ofSize: 14), textColor: .black)
    private lazy var ratingLable = UILabel(text: "Rating : 4.11/5", font: .systemFont(ofSize: 14), textColor: .black)
    private lazy var descriptionLabel = UILabel(text: "Description:", font: .systemFont(ofSize: 14), textColor: .black)
    private lazy var addToListbutton = UIButton(title: "Add to list", titleColor: .black, backgroundColor: .gray, cornerRadius: 4, font: .systemFont(ofSize: 14))
    private lazy var readButton = UIButton(title: "Read", titleColor: .white, backgroundColor: .black, cornerRadius: 4, font: .systemFont(ofSize: 14))
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function's
        setupView()
        setupConstraints()
    }
    
    ///Setup and configure view
    private func setupView() {
        view.addSubviews(bookNameLabel, bookPicture, bookInformationStack, descriptionLabel, addToListbutton, readButton)
        bookInformationStack.addArrangedSubviews(authorLabel, categoryLable, ratingLable)
        bookPicture.dropShadow()
    }
}

//MARK: - Extension

extension ScreenProductViewController {
    
    ///Setup constraints for ui elements
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
            
            // Book information stack
            bookInformationStack.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 34),
            bookInformationStack.leadingAnchor.constraint(equalTo: bookPicture.trailingAnchor, constant: 22),
            bookInformationStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 44),
            bookInformationStack.heightAnchor.constraint(equalToConstant: 82),
            
            // Description label
            descriptionLabel.topAnchor.constraint(equalTo: bookPicture.bottomAnchor, constant: 18),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 19),
            
            
            // Add to list button
            addToListbutton.topAnchor.constraint(equalTo: bookInformationStack.bottomAnchor, constant: 21),
            addToListbutton.leadingAnchor.constraint(equalTo: bookPicture.trailingAnchor, constant: 22),
            addToListbutton.heightAnchor.constraint(equalToConstant: 40),
            addToListbutton.widthAnchor.constraint(equalToConstant: 161),
            
            // Read button
            readButton.topAnchor.constraint(equalTo: addToListbutton.bottomAnchor, constant: 13),
            readButton.leadingAnchor.constraint(equalTo: bookPicture.trailingAnchor, constant: 22),
            readButton.heightAnchor.constraint(equalToConstant: 40),
            readButton.widthAnchor.constraint(equalToConstant: 161),
            
        ])
    }
}
