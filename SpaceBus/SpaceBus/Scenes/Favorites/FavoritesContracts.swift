//
//  FavoritesContracts.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

protocol FavoritesViewModelProtocol {
    var delegate: FavoritesViewModelDelegate? { get set }
    func load()
}

enum FavoritesViewModelOutput {
    case setFavorites([Spaceship])
}

protocol FavoritesViewModelDelegate {
    func handleViewModelOutput(_ output: FavoritesViewModelOutput)
}
