//
//  AppRouter.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = SplashBuilder.make()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
