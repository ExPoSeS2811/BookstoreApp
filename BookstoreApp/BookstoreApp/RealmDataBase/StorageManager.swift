//
//  StorageManager.swift
//  BookstoreApp
//
//  Created by Nikita on 11.12.2023.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManager {
 
    static func saveObject(book: LikeBook) {
        try! realm.write({
            realm.add(book)
        })
    }
    
    static func removeObject(book: LikeBook) {
        try! realm.write({
            realm.delete(book)
        })
    }
}
