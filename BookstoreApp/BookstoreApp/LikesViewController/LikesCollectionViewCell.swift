//
//  LikesCollectionViewCell.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

class LikesCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "Cell"
    
    //MARK: - User elements
    
    private lazy var cellView = UIView()
    private lazy var bookImage = UIImageView()
    private lazy var labelsStack = UIStackView(axis: .vertical)
    private lazy var categoryCellLabel = UILabel(text: "Classic", font: .systemFont(ofSize: 10), textColor: .white)
    private lazy var bookCellLabel = UILabel(text: "The Picture of Dorian Gray", font: .systemFont(ofSize: 14), textColor: .white)
    private lazy var authorCellLabel = UILabel(text: "Oscar Wilde", font: .systemFont(ofSize: 10), textColor: .white)
    private let deleteButtonImage = ButtonBackgroundImage(image: UIImage(systemName: "xmark"), tintColor: .white)
    private lazy var deleteButton = UIButton(backgroundImage: deleteButtonImage)
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        // Call function's
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    /// Setup collection view cell
    private func setupCell() {
        
        // Content view
        self.backgroundColor = .black
        self.addSubviews(cellView)
        
        // Cell view
        cellView.dropShadow()
        cellView.addSubviews(bookImage, labelsStack, deleteButton)
        labelsStack.addArrangedSubviews(categoryCellLabel, bookCellLabel, authorCellLabel)
        bookImage.image = UIImage(named: "DorianGray")
        bookImage.contentMode = .scaleToFill
    }
}

//MARK: - Extension

extension LikesCollectionViewCell {
    
    /// Numbers for constraints
    private enum Constants {
        static let bookImageHeight: CGFloat = 140
        static let bookImageWidht: CGFloat = 90
        static let labelsStackWidht: CGFloat = 180
        static let tenPoints: CGFloat = 10
        static let twentyPoints: CGFloat = 20
        static let buttonHeightWidth: CGFloat = 50
    }
    
    ///Setup constraints for ui elements
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            // Cell view
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Image view
            bookImage.topAnchor.constraint(equalTo: cellView.topAnchor),
            bookImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            bookImage.heightAnchor.constraint(equalToConstant: Constants.bookImageHeight),
            bookImage.widthAnchor.constraint(equalToConstant: Constants.bookImageWidht),
            
            // Labels stack
            labelsStack.topAnchor.constraint(equalTo: cellView.topAnchor, constant: Constants.twentyPoints),
            labelsStack.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: Constants.tenPoints),
            labelsStack.widthAnchor.constraint(equalToConstant: Constants.labelsStackWidht),
            
            // Delete button
            deleteButton.topAnchor.constraint(equalTo: cellView.topAnchor, constant: Constants.tenPoints),
            deleteButton.leadingAnchor.constraint(equalTo: labelsStack.trailingAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: Constants.buttonHeightWidth),
            deleteButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeightWidth),
        ])
    }
}
