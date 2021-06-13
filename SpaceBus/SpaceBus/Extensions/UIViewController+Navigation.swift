//
//  UIViewController+Navigation.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

extension UIViewController {
    
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if #available(iOS 13.0, *) {
            guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
            show(nextViewController, sender: self)
        } else {
            guard let nextViewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return }
            show(nextViewController, sender: self)
        }
    }
    
    func setRoot<T: UIViewController>(viewController: T) {
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func setRootViewController<T: UIViewController>(viewController: T, from storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if #available(iOS 13.0, *) {
            guard let rootViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
            UIApplication.shared.windows.first?.rootViewController = rootViewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            // Fallback on earlier versions
            guard let rootViewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return }
            UIApplication.shared.windows.first?.rootViewController = rootViewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func getViewController<T: UIViewController>(viewController: T, from storyboard: String) -> T {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        if #available(iOS 13.0, *) {
            guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return T() }
            return nextViewController
        } else {
            // Fallback on earlier versions
            guard let nextViewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return T() }
            return nextViewController
        }
    }
    
    func setRootNavigationController(with viewController: String, from storyboardName: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if #available(iOS 13.0, *) {
            guard let rootViewController = storyboard.instantiateViewController(identifier: viewController) as? UINavigationController else { return }
            UIApplication.shared.windows.first?.rootViewController = rootViewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            // Fallback on earlier versions
            guard let rootViewController = storyboard.instantiateViewController(withIdentifier: viewController) as? UINavigationController else { return }
            UIApplication.shared.windows.first?.rootViewController = rootViewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func goToAlert(with viewController: AlertViewController) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
    }
    
    func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
