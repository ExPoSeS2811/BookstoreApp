//
//  ScreenCategoriesViewController.swift
//  BookstoreApp
//
//  Created by Timofey Spodeneyko on 05.12.2023.
//

import UIKit

class ScreenCategoriesViewController: UIViewController {

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Поиск книг/авторов/жанров"
        return searchBar
    }()

    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
        return button
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Категории"

        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(filterButton)

        view.addSubview(stackView)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            // Констрейнты для stackView
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackViewHorizontalPadding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.stackViewHorizontalPadding),
            stackView.heightAnchor.constraint(equalToConstant: Constants.stackViewHeight),

            // Констрейнты для collectionView
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Constants.collectionViewTopPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.collectionViewHorizontalPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.collectionViewHorizontalPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.collectionViewBottomPadding)
        ])

        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
    }

    // MARK: - Button Action

    @objc private func filterButtonTapped() {
        print("Filter button tapped!")
    }
}

// MARK: - UICollectionViewDataSource
extension ScreenCategoriesViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 20 // Количество ячеек
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: "Текст \(indexPath.item + 1)")

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ScreenCategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: Constants.cellWidth, height: Constants.cellHeight)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 30
    }
}

extension ScreenCategoriesViewController {
    private enum Constants {
        static let cellIdentifier = "categoryCell"
        
        static let cellWidth: CGFloat = 150.0
        static let cellHeight: CGFloat = 100.0
        
        static let stackViewHorizontalPadding: CGFloat = 10.0
        static let stackViewHeight: CGFloat = 50.0
        
        static let collectionViewTopPadding: CGFloat = 10.0
        static let collectionViewHorizontalPadding: CGFloat = 20.0
        static let collectionViewBottomPadding: CGFloat = 50.0
    }
}
