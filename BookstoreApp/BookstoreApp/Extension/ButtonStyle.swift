//
//  ButtonStyle.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

struct ButtonTextStyle {
    
    static let defaultTextStyle = ButtonTextStyle.self
    
    let title: String?
    let titleColor: UIColor?
    let font: UIFont?
    
}

struct ButtonBackgroundStyle {
    
    static let defaultBackgroundStyle = ButtonBackgroundStyle.self
    
    let backgroundColor: UIColor?
    let cornerRadius: CGFloat?
}
