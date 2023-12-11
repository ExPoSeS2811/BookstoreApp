//
//  LikesCollectionView.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit
import RealmSwift

class LikesCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    private var books: Results<LikeBook>!
    
    //MARK: - Initialize
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        // Call function's
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    /// Setup collection method
    private func setupCollection() {
        register(LikesCollectionViewCell.self, forCellWithReuseIdentifier: LikesCollectionViewCell.reuseID)
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        books = realm.objects(LikeBook.self)
    }
    
    @objc func deleteButtonTapped(complitionHandler: @escaping ()-> Void) {
        
    }
}

//MARK: - Extension

extension LikesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Collection view data source, delegate and flow Layout methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: LikesCollectionViewCell.reuseID, for: indexPath) as! LikesCollectionViewCell
        cell.layer.cornerRadius = 8
        cell.authorCellLabel.text = books[indexPath.row].author
        cell.bookCellLabel.text = books[indexPath.row].book
        cell.categoryCellLabel.text = books[indexPath.row].category
        let imageForCell = books[indexPath.row].bookImage
        cell.bookImage.image = UIImage(data: imageForCell)
        cell.addTargets(target: self, selector: #selector(deleteButtonTapped { [self] in
            let book = books[indexPath.row]
            StorageManager.removeObject(book: book)
            self.deleteItems(at: books)
        }))
        reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 140)
    }
}
