//
//  AlertViewController.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class AlertViewController: BaseViewController {
    
    @IBOutlet private weak var fullView: UIView?
    @IBOutlet private weak var alertView: UIView?
    @IBOutlet private weak var messageLabel: UILabel?
    
    var message: String?
    
    var viewModel: AlertViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load(with: message ?? "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != alertView {
            viewModel?.closeTapped()
        }
    }
    
    @IBAction private func okPressed(_ sender: UIButton) {
        viewModel?.closeTapped()
    }
}

extension AlertViewController: AlertViewModelDelegate {
    func handleViewModelOutput(_ output: AlertViewModelOutput) {
        switch output {
        case .showMessage(let message):
            self.messageLabel?.text = message
        }
    }
    
    func navigate(to route: AlertRouter) {
        switch route {
        case .dismiss:
            self.dismiss(animated: true, completion: nil)
        }
    }
}
