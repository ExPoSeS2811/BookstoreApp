//
//  ButtonStyle.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

struct ButtonTextStyle {
    
    static let defaultTextStyle = ButtonTextStyle()
    
    var title: String?
    var titleColor: UIColor?
    var font: UIFont?
    
}

struct ButtonBackgroundStyle {
    
    static let defaultBackgroundStyle = ButtonBackgroundStyle()
    
    var backgroundColor: UIColor?
    var cornerRadius: CGFloat?
}
