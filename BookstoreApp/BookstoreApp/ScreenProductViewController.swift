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
    private lazy var descriptionLabel = UILabel(text: "Description:", font: .systemFont(ofSize: 14), textColor: .black)
    
    private lazy var bookPicture: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.image = UIImage(named: "DorianGray")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var bookInformationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        
        let text = "Author: "
        let normalString = NSMutableAttributedString(string: text)
        
        let boldText = "Oscar Wilde"
        let bold = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        let atributed = NSMutableAttributedString(string: boldText, attributes: bold)
        normalString.append(atributed)
        label.attributedText = normalString
        return label
    }()
    
    private lazy var categoryLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        
        let text = "Category: "
        let normalString = NSMutableAttributedString(string: text)
        
        let boldText = "Classics"
        let bold = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        let atributed = NSMutableAttributedString(string: boldText, attributes: bold)
        normalString.append(atributed)
        label.attributedText = normalString
        return label
    }()
    
    private lazy var ratingLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        
        let text = "Rating: "
        let normalString = NSMutableAttributedString(string: text)
        
        let boldText = "4.11/5"
        let bold = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        let atributed = NSMutableAttributedString(string: boldText, attributes: bold)
        normalString.append(atributed)
        label.attributedText = normalString
        return label
    }()
    
    private lazy var addToListbutton = UIButton(title: "Add to list", titleColor: .black, backgroundColor: .gray, cornerRadius: 4, font: .systemFont(ofSize: 14))
    private lazy var readButton = UIButton(title: "Read", titleColor: .white, backgroundColor: .black, cornerRadius: 4, font: .systemFont(ofSize: 14))
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 14)
        textView.isEditable = false
        textView.text = "Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he must keep hidden from the world. For over a century, this mesmerizing tale of horror and suspense has enjoyed wide popularity. It ranks as one of Wilde's most important creations and among the classic achievements of its kind."
        return textView
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function's
        setupView()
        setupConstraints()
    }
    
    //MARK: - Private methods
    
    ///Setup and configure view
    private func setupView() {
        
        // Swtup view
        view.backgroundColor = .white
        view.addSubviews(bookNameLabel, bookPicture, bookInformationStack, descriptionLabel, addToListbutton, readButton, descriptionTextView)
        bookInformationStack.addArrangedSubviews(authorLabel, categoryLable, ratingLable)
        bookPicture.dropShadow()
        
        // Setup navigation bar
        let likeButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(likeButtonTapped))
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.rightBarButtonItem = likeButton
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Category"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Objective-C methods
    
    /// Action for like button
    @objc func likeButtonTapped() {
        
    }
    
    /// Go back for left bar button item
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension

extension ScreenProductViewController {
    
    ///Setup constraints for ui elements
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Book name label
            bookNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 22),
            bookNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            bookNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            bookNameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            // Book picture
            bookPicture.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 16),
            bookPicture.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 19),
            bookPicture.heightAnchor.constraint(equalToConstant: 214),
            bookPicture.widthAnchor.constraint(equalToConstant: 138),
            
            // Book information stack
            bookInformationStack.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 34),
            bookInformationStack.leadingAnchor.constraint(equalTo: bookPicture.trailingAnchor, constant: 22),
            bookInformationStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -44),
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
            
            // Description text view
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
