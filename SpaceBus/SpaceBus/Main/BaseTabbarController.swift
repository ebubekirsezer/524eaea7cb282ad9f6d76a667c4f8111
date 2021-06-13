//
//  BaseTabbarController.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation
import UIKit


enum TabbarItemType {
    case home
    case favorites
}

class BaseTabbarController: UITabBarController {
    
    var items: [TabbarItemType] {
        get {
            return [.home, .favorites]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = BaseColor.shared.PrimaryColor
        UITabBar.appearance().tintColor = BaseColor.shared.TextOnPrimaryColor
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        setupTabbar()
    }
    
    private func setupTabbar() {
        var viewControllers: [UIViewController] = []
        
        items.forEach { item in
            var viewController: UIViewController = UIViewController()
            let tabbarItem = UITabBarItem()
            switch item {
            case .home:
                viewController = InstantiateViewController(with: "HomeViewController", from: "Home")
                tabbarItem.title = "Home"
                tabbarItem.image = UIImage(named: "home")

            case .favorites:
                viewController = InstantiateViewController(with: "FavoritesViewController", from: "Favorites")
                tabbarItem.title = "Favorites"
                tabbarItem.image = UIImage(named: "favorites")
            }
            
            let navigationController = UINavigationController()
            navigationController.tabBarItem = tabbarItem
            navigationController.setViewControllers([viewController], animated: true)
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.tintColor = .white
            
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController.navigationBar.titleTextAttributes = textAttributes
            viewControllers.append(navigationController)
            setViewControllers(viewControllers, animated: true)
        }
    }
}


public func InstantiateViewController(with viewController: String, from storyboard: String) -> UIViewController {
    return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: viewController)
}
