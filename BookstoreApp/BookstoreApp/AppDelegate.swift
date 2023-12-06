import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window {
            let tapBar = TabBar()      
            let tabBarController = TabBarController(tabBar: tapBar)
            tabBarController.setupViewControllers()
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
        }
        return true
    }
}

