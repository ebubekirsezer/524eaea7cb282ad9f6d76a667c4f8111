//
//  SplashViewController.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class SplashViewController: BaseViewController {
    
    @IBOutlet private weak var titleLabel: UILabel?
    
    var viewModel: SplashViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        viewModel?.navigateAddSpaceship()
    }
    
    private func setTitle(with title: String) {
        var characterIndex = 0.0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { (timer) in
                self.titleLabel?.text?.append(letter)
            }
            characterIndex += 1
        }
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func handleViewModelOutput(_ output: SplashViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            setTitle(with: title)
        }
    }
    
    func navigate(to route: SplashRoute) {
        
        switch route {
        case .addSpaceship(let viewModel):
            let viewController = AddSpaceshipBuilder.make(with: viewModel)
            self.setRoot(viewController: viewController)
        case .home:
            self.setRootViewController(viewController: BaseTabbarController(), from: "Home")
        }
    }
}
