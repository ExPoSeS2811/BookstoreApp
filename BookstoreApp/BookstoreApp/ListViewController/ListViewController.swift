//
//  ListViewController.swift
//  BookstoreApp
//
//  Created by Nikita on 08.12.2023.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - UI elements
    
    private let wantToReadView = CustomListView(text: "Want to read", font: .systemFont(ofSize: 16), cornerRadius: 5)
    private let classicBooksView = CustomListView(text: "Classic books", font: .systemFont(ofSize: 16), cornerRadius: 5)
    private let readForFunView = CustomListView(text: "Read for fun", font: .systemFont(ofSize: 16), cornerRadius: 5)

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Call function's
        setupView()
        setupConstraints()
    }
    
    //MARK: - Private methods
    
    private func setupView() {
        // Setup view
        view.backgroundColor = .white
        view.addSubviews(wantToReadView, classicBooksView, readForFunView)
        
        // Setup navigation
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(goBack))
        backButton.tintColor = .black
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addedButtonTapped))
        rightBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = backButton
        title = "List"
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    //MARK: - Objective-C methods
    
    @objc func addedButtonTapped() {
        
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension

extension ListViewController {
    
    /// Numbers for constraints
    private enum Constants {
        static let tenPoints: CGFloat = 10
        static let twentyPoints: CGFloat = 20
        static let thirtyPints: CGFloat = 30
        static let viewHeight: CGFloat = 60
    }
    
    /// Setup constraints for ui elements
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            // Want to read view
            wantToReadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.thirtyPints),
            wantToReadView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.twentyPoints),
            wantToReadView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.twentyPoints),
            wantToReadView.heightAnchor.constraint(equalToConstant: Constants.viewHeight),
            
            // Classic books view
            classicBooksView.topAnchor.constraint(equalTo: wantToReadView.bottomAnchor, constant: Constants.tenPoints),
            classicBooksView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.twentyPoints),
            classicBooksView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.twentyPoints),
            classicBooksView.heightAnchor.constraint(equalToConstant: Constants.viewHeight),
            
            // Read for fun view
            readForFunView.topAnchor.constraint(equalTo: classicBooksView.bottomAnchor, constant: Constants.tenPoints),
            readForFunView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.twentyPoints),
            readForFunView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.twentyPoints),
            readForFunView.heightAnchor.constraint(equalToConstant: Constants.viewHeight),
        ])
    }
}
