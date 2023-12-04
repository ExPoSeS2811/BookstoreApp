//
//  UIStackView - Extension.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ view: UIView...) {
        view.forEach { views in
            views.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(views)
        }
    }
}
