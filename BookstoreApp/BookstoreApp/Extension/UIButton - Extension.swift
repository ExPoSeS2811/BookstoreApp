//
//  UIButton - Extension.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

extension UIButton {
    
    convenience init(title: String? = nil, titleColor: UIColor? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = 0, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, image: String? = nil, font: UIFont? = nil) {
        self.init(type: .system)
        self.frame = .infinite
        self.tintColor = .white
        
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        if let titleColor = titleColor {
            self.setTitleColor(titleColor, for: .normal)
        }
        
        if let color = backgroundColor {
            self.backgroundColor = color
        }
        
        if let radius = cornerRadius {
            self.layer.cornerRadius = radius
        }
        
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        
        if let borderColor = borderColor {
            self.layer.borderColor = borderColor.cgColor
        }
        
        if let image = image {
            let uiImage = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            self.setImage(uiImage, for: .normal)
        }
        
        if let font = font {
            self.titleLabel?.font = font
        }
    }
}