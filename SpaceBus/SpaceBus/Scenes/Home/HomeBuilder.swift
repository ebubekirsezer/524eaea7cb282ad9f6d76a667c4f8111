//
//  HomeBuilder.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class HomeBuilder {
    static func make(with viewModel: HomeViewModelProtocol) -> HomeViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}
