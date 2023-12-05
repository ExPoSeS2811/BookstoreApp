//
//  UIVIew - Extension.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ view: UIView...) {
        view.forEach { views in
            views.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(views)
        }
    }
    
    func dropShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -1, height: 3)
        self.layer.shadowRadius = 4
    }
}

extension UIView {
    static var safeAreaInset: UIEdgeInsets {
        if #available(iOS 11.0, *), let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow.safeAreaInsets
        } else {
            // Возвращаем UIEdgeInsets.zero для устройств с iOS ниже 11.0
            return UIEdgeInsets.zero
        }
    }
}
