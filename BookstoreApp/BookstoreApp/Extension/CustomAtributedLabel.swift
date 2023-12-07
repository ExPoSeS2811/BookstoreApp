//
//  CustomAtributedLabel.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

class CustomAttributedLabel: UILabel {
    let labelText: String
    let boldText: String
    let normalString: NSMutableAttributedString
    let bold = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
    let attributed: NSMutableAttributedString

    init(text: String, boldText: String) {
        self.labelText = text
        self.boldText = boldText
        self.normalString = NSMutableAttributedString(string: labelText)
        self.attributed = NSMutableAttributedString(string: boldText, attributes: bold)
        super.init(frame: .zero)
        normalString.append(attributed)
        self.attributedText = normalString
        
        if let textColor = textColor {
            self.textColor = textColor
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabel() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 14)
    }
}
