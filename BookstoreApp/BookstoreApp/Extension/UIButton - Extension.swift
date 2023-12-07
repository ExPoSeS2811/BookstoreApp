//
//  UIButton - Extension.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

extension UIButton {
    
    convenience init(textStyle: ButtonTextStyle = .defaultTextStyle, backgroundStyle: ButtonBackgroundStyle = .defaultBackgroundStyle, backgroundImage: ButtonBackgroundImage = .defaultBackgroundImage) {
        self.init(type: .system)
        self.frame = .infinite
        self.tintColor = .white
        
        if textStyle.title != nil {
            self.setTitle(textStyle.title, for: .normal)
        }
        
        if let titleColor = textStyle.titleColor {
            self.setTitleColor(titleColor, for: .normal)
        }
        
        if let color = backgroundStyle.backgroundColor {
            self.backgroundColor = color
        }
        
        if let radius = backgroundStyle.cornerRadius {
            self.layer.cornerRadius = radius
        }
        
        if let font = textStyle.font {
            self.titleLabel?.font = font
        }
        
        if let image = backgroundImage.image {
            self.setImage(image, for: .normal)
        }
        
        if let tintColor = backgroundImage.tintColor {
            self.tintColor = tintColor
        }
    }
}
