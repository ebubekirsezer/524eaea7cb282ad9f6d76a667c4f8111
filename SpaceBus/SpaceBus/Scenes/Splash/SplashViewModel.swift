//
//  SplashViewModel.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

final class SplashViewModel: SplashViewModelProtocol {
    var delegate: SplashViewModelDelegate?
    
    func load() {
        notify(.updateTitle("SpaceBus 🚀"))
    }
    
    func navigateAddSpaceship() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            if let shipName = UserDefaults.standard.string(forKey: Constants.USER_DEFAULTS_SHIP_NAME) {
                self.delegate?.navigate(to: .home)
            } else {
                let viewModel = AddSpaceshipViewModel()
                self.delegate?.navigate(to: .addSpaceship(viewModel))
            }
        }
    }
    
    private func notify(_ output: SplashViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
