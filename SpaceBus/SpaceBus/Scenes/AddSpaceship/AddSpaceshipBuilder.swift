//
//  AddSpaceshipBuilder.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class AddSpaceshipBuilder {
    
    static func make(with viewModel: AddSpaceshipViewModelProtocol) -> AddSpaceshipViewController {
        let storyboard = UIStoryboard(name: "AddSpaceship", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddSpaceshipViewController") as! AddSpaceshipViewController
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}
