//
//  LikeBook.swift
//  BookstoreApp
//
//  Created by Nikita on 11.12.2023.
//

import Foundation
import RealmSwift

class LikeBook: Object {
    
    @objc dynamic var author: String?
    @objc dynamic var book: String?
    @objc dynamic var category: String?
    @objc dynamic var bookImage = Data()
    
    
    convenience init(author: String, book: String, category: String, bookImage: Data) {
        self.init()
        self.author = author
        self.book = book
        self.category = category
        self.bookImage = bookImage
    }
    
}
