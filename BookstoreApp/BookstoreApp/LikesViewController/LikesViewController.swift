//
//  LikesViewController.swift
//  BookstoreApp
//
//  Created by Nikita on 07.12.2023.
//

import UIKit

class LikesViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private lazy var likeCollectionView = LikesCollectionView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function's
        setupView()
        setupConstraints()
    }
    
    //MARK: - Private methods
    /// Setup view method
    private func setupView() {
    
        // Setup view
        view.backgroundColor = .white
        view.addSubviews(likeCollectionView)
        
        // Setup navigation
        title = "Likes"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Setup like collection
        likeCollectionView.showsVerticalScrollIndicator = false
    }
}

//MARK: - Extension

extension LikesViewController {
    
    /// Numbers for constraints
    private enum Constants {
        static let twentyPoints: CGFloat = 20
    }
    
    ///Setup constraints for ui elements
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // Like collection
            likeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            likeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            likeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            likeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.twentyPoints),
        ])
    }
}
