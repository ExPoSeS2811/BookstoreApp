//
//  TabBar.swift
//  BookstoreApp
//
//  Created by Gleb Rasskazov on 06.12.2023.
//

import UIKit

class TabBar: UITabBar {
    private var shapeLayer: CAShapeLayer?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowOpacity = 0.5
        shapeLayer.shadowRadius = 20

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let radius: CGFloat = 20
        let yOffset: CGFloat = 24
        let xOffset: CGFloat = 8

        let rectBounds = CGRect(x: xOffset,
                                y: yOffset,
                                width: self.bounds.width - xOffset * 2,
                                height: self.bounds.height - yOffset * 2)

        let roundedRectPath = UIBezierPath(roundedRect: rectBounds, cornerRadius: radius)

        return roundedRectPath.cgPath
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height += UIView.safeAreaInset.bottom
        return sizeThatFits
    }
}
