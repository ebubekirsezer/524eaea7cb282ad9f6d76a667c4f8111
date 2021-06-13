//
//  AlertContracts.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

protocol AlertViewModelProtocol {
    var delegate: AlertViewModelDelegate? { get set }
    func load(with message: String)
    func closeTapped()
}

enum AlertViewModelOutput {
    case showMessage(String)
}

enum AlertRouter {
    case dismiss
}

protocol AlertViewModelDelegate {
    func handleViewModelOutput(_ output: AlertViewModelOutput)
    func navigate(to route: AlertRouter)
}
