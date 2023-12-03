//
//  AppDelegate.swift
//  BookstoreApp
//
//  Created by Gleb Rasskazov on 03.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window {
            window.rootViewController = TabBarController()
            window.makeKeyAndVisible()
        }
        
        return true
    }
}
