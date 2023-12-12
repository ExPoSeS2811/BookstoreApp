//
//  LikesCollectionView.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

class LikesCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    let realmMethods = RealmMethods()
    
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
        realmMethods.books = realm.objects(LikeBook.self)
    }
}

//MARK: - Extension

extension LikesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Collection view data source, delegate and flow Layout methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realmMethods.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: LikesCollectionViewCell.reuseID, for: indexPath) as? LikesCollectionViewCell  else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 8
        cell.authorCellLabel.text = realmMethods.books[indexPath.row].author
        cell.bookCellLabel.text = realmMethods.books[indexPath.row].book
        cell.categoryCellLabel.text = realmMethods.books[indexPath.row].category
        let imageForCell = realmMethods.books[indexPath.row].bookImage
        cell.bookImage.image = UIImage(data: imageForCell)
        reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 140)
    }
}
