//
//  RealmMethods.swift
//  BookstoreApp
//
//  Created by Nikita on 12.12.2023.
//

import Foundation
import RealmSwift

class RealmMethods {
    
    var books: Results<LikeBook>!
    
    func save(_ object: LikeBook) {
        StorageManager.saveObject(book: object)
    }
    
    func remove(_ object: LikeBook) {
        StorageManager.removeObject(book: object)
    }
}
