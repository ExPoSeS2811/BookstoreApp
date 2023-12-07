//
//  UIButton - Extension.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

extension UIButton {
    
    init(buttonTextStyle: ButtonTextStyle = .defaultTextStyle, buttonBackgroundStyle: ButtonBackgroundStyle = .defaultBackgroundStyle) {
        self.init(type: .system)
        self.frame = .infinite
        self.tintColor = .white
        
        if let title = buttonTextStyle.title {
            self.setTitle(buttonTextStyle.title, for: .normal)
        }
        
        if let titleColor = buttonTextStyle.titleColor {
            self.setTitleColor(titleColor, for: .normal)
        }
        
        if let color = buttonBackgroundStyle.backgroundColor {
            self.backgroundColor = color
        }
        
        if let radius = buttonBackgroundStyle.cornerRadius {
            self.layer.cornerRadius = radius
        }
        
        if let font = buttonTextStyle.font {
            self.titleLabel?.font = font
        }
    }
}
