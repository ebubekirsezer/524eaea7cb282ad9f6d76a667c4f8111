//
//  SplashBuilder.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class SplashBuilder {
    
    static func make() -> SplashViewController {
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        
        viewController.viewModel = SplashViewModel()
        return viewController
    }
}
