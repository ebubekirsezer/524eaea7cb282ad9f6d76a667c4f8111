//
//  AlertBuilder.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class AlertBuilder {
    static func make(with viewModel: AlertViewModelProtocol, message: String?) -> AlertViewController {
        let storyboard = UIStoryboard(name: "Alert", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        
        viewController.message = message
        viewController.viewModel = viewModel
        
        return viewController
    }
}
