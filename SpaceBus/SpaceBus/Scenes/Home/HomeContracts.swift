//
//  HomeContracts.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    func load()
    func filterSpaceships(with text: String) -> [Spaceship]
}

enum HomeViewModelOutput {
    case updateNavigationTitle(String)
    case setSpaceships([Spaceship])
    case setInformations(name: String, ugs: String, eus: String, ds: String, damage: String, time: String)
    case setLoading(Bool)
}

enum HomeRouter {
    case alert(AlertViewModelProtocol, String)
}

protocol HomeViewModelDelegate {
    func handleViewModelOutput(_ output: HomeViewModelOutput)
    func navigate(to route: HomeRouter)
}
