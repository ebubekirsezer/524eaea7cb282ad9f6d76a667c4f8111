//
//  SplashContracts.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

protocol SplashViewModelProtocol {
    var delegate: SplashViewModelDelegate? { get set }
    func load()
    func navigateAddSpaceship()
}

enum SplashViewModelOutput {
    case updateTitle(String)
}

enum SplashRoute {
    case addSpaceship(AddSpaceshipViewModelProtocol)
    case home
}

protocol SplashViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: SplashViewModelOutput)
    func navigate(to route: SplashRoute)
}
