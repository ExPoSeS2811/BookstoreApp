import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 0
    }
    
    init(tabBar: UITabBar) {
        super.init(nibName: nil, bundle: nil)
        self.setValue(tabBar, forKey: "tabBar")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewControllers() {
        self.viewControllers = [
            setupTabBarСontroller(vc: HomeViewController(), tabBarItems: .house),
            setupTabBarСontroller(vc: ScreenCategoriesViewController(), tabBarItems: .categories),
            setupTabBarСontroller(vc: HomeViewController(), tabBarItems: .likes),
            setupTabBarСontroller(vc: HomeViewController(), tabBarItems: .account)
        ]
    }
    
    func setupTabBarСontroller(vc: UIViewController, tabBarItems: TabBarItems) -> UINavigationController{
        let vc = UINavigationController(rootViewController: vc)
        vc.navigationBar.prefersLargeTitles = true
        vc.tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
        return vc
    }
}
