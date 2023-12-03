//
//  TabBarViewController.swift
//  BookstoreApp
//
//  Created by Gleb Rasskazov on 03.12.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        viewControllers = [
            setupNavigationController(
                rootViewController: HomeViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            setupNavigationController(
                rootViewController: HomeViewController(),
                title: "Categories",
                image: UIImage(systemName: "circle.grid.3x3.fill")
            ),
            setupNavigationController(
                rootViewController: HomeViewController(),
                title: "Likes",
                image: UIImage(systemName: "heart.fill")
            ),
            setupNavigationController(
                rootViewController: HomeViewController(),
                title: "Account",
                image: UIImage(systemName: "person.crop.circle.fill")
            )
        ]
    }
    
    private func setupNavigationController(
        rootViewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.tabBarItem.title = title
        if let image = image {
            navigationController.tabBarItem.image = image
        }
        navigationController.navigationBar.prefersLargeTitles = true

        rootViewController.navigationItem.title = title
        
        return navigationController
    }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = appearance
        view.tintColor = .black
    }
}
