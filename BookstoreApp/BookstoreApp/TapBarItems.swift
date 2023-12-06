import UIKit

enum TabBarItems {
    case house
    case categories
    case likes
    case account
    
    var title: String {
        switch self {
            case .house: return "Top Books"
            case .categories: return "Categories"
            case .likes: return "Likes"
            case .account: return "Account"
        }
    }
    
    var image: UIImage? {
        switch self {
            case .house: return UIImage(systemName: "house")
            case .categories: return UIImage(systemName: "circle.grid.3x3")
            case .likes: return UIImage(systemName: "heart")
            case .account: return UIImage(systemName: "person.crop.circle")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
            case .house: return UIImage(systemName: "house.fill")
            case .categories: return UIImage(systemName: "circle.grid.3x3.fill")
            case .likes: return UIImage(systemName: "heart.fill")
            case .account: return UIImage(systemName: "person.crop.circle.fill")
        }
    }
}
