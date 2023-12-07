//
//  AccountViewController.swift
//  BookstoreApp
//
//  Created by Michael Kivo on 06.12.2023.
//

import UIKit

final class AccountViewController: UIViewController {

    var accountLabel: UILabel = {
        var label = UILabel()
        label.text = "Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    var profileImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "account_circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var profileButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    var midView: UIView = {
        var midView = UIView()
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.backgroundColor = .systemGray
        
        return midView
    }()
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Name: "
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var nameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "John Doe"
        textField.textColor = .black
        
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(accountLabel)
        view.addSubview(profileImageView)
        view.addSubview(midView)
        view.addSubview(profileButton)
        midView.addSubview(nameLabel)
        midView.addSubview(nameTextField)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            accountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155),
            accountLabel.widthAnchor.constraint(equalToConstant: 83),
            accountLabel.heightAnchor.constraint(equalToConstant: 45),
            
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 129),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            
            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 129),
            profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            profileButton.widthAnchor.constraint(equalToConstant: 120),
            profileButton.heightAnchor.constraint(equalToConstant: 120),
            
            midView.widthAnchor.constraint(equalToConstant: 320),
            midView.heightAnchor.constraint(equalToConstant: 56),
            midView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            midView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 205),
            
            nameLabel.topAnchor.constraint(equalTo: midView.topAnchor, constant: 14),
            nameLabel.leadingAnchor.constraint(equalTo: midView.leadingAnchor, constant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: midView.topAnchor, constant: 14),
            nameTextField.leadingAnchor.constraint(equalTo: midView.leadingAnchor, constant: 125)
        ])
    }
    
    // TODO: add photo from library addding
    
    @objc private func buttonTapped() {
        self.view.endEditing(true)
        self.midView.endEditing(true)
    }

}
