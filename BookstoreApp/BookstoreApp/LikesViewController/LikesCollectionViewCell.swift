//
//  LikesCollectionViewCell.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

class LikesCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "Cell"
    private lazy var cellView = UIView()
    private lazy var bookImage = UIImageView()
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    private lazy var categoryCellLabel = UILabel(text: "Classic", font: .systemFont(ofSize: 10), textColor: .white)
    private lazy var bookCellLabel = UILabel(text: "The Picture of Dorian Gray", font: .systemFont(ofSize: 14), textColor: .white)
    private lazy var authorCellLabel = UILabel(text: "Oscar Wilde", font: .systemFont(ofSize: 10), textColor: .white)
//    private lazy var deleteButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        // Content view
        self.backgroundColor = .black
        self.addSubviews(cellView)
        
        // Cell view
        cellView.dropShadow()
        cellView.addSubviews(bookImage, labelsStack)
        labelsStack.addArrangedSubviews(categoryCellLabel, bookCellLabel, authorCellLabel)
        bookImage.image = UIImage(named: "DorianGray")
        bookImage.contentMode = .scaleToFill
    }
}

extension LikesCollectionViewCell {
    
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
            bookImage.heightAnchor.constraint(equalToConstant: 140),
            bookImage.widthAnchor.constraint(equalToConstant: 95),
            
            // Labels stack
            labelsStack.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 50),
            labelsStack.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 10),
            labelsStack.widthAnchor.constraint(equalToConstant: 180),
            
        ])
    }
}
