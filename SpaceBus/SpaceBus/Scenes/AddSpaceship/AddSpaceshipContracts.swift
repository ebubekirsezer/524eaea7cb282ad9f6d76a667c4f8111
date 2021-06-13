//
//  AddSpaceshipContracts.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

protocol AddSpaceshipViewModelProtocol {
    var delegate: AddSpaceshipViewModelDelegate? { get set }
    func load()
    func saveSpaceship(name: String, strengthValue: Int, speedValue: Int, capacityValue: Int)
    func strengthValueChanged(with sender: UISlider)
    func speedValueChanged(with sender: UISlider)
    func capacityValueChanged(with sender: UISlider)
}

enum AddSpaceshipViewModelOutput {
    case save
    case strengthChanged(Int)
    case speedChanged(Int)
    case capacityChanged(Int)
    case updateTitle(String)
}

enum AddSpaceshipRouter {
    case home(HomeViewModelProtocol)
    case alert(AlertViewModelProtocol, String)
}

protocol AddSpaceshipViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: AddSpaceshipViewModelOutput)
    func navigate(to route: AddSpaceshipRouter)
}
