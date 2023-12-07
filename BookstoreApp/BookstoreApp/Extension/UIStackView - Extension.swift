//
//  UIStackView - Extension.swift
//  BookstoreApp
//
//  Created by Nikita on 04.12.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis?) {
        self.init()
        if let axis = axis {
            self.axis = axis
        }
    }
    
    func addArrangedSubviews(_ view: UIView...) {
        view.forEach { views in
            views.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(views)
        }
    }
}
