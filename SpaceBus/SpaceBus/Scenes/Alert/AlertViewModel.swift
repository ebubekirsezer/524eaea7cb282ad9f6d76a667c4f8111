//
//  AlertViewModel.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation


final class AlertViewModel: AlertViewModelProtocol {
    
    var delegate: AlertViewModelDelegate?
    
    func load(with message: String) {
        notify(.showMessage(message))
    }
    
    func closeTapped() {
        self.delegate?.navigate(to: .dismiss)
    }
    
    private func notify(_ output: AlertViewModelOutput) {
        self.delegate?.handleViewModelOutput(output)
    }
}
