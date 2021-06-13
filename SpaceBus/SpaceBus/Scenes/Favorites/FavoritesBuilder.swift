//
//  FavoritesBuilder.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class FavoritesBuilder {
    
    static func make(with viewModel: FavoritesViewModelProtocol, favorites: [Spaceship]) -> FavoritesViewController {
        let storyboard = UIStoryboard(name: "Favorites", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
        
        viewController.viewModel = viewModel
        viewController.spaceships = favorites
        
        return viewController
    }
}
