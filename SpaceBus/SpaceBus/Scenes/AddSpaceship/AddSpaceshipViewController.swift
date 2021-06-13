//
//  AddSpaceshipViewController.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class AddSpaceshipViewController: BaseViewController {
    
    @IBOutlet private weak var totalPointLabel: UILabel?
    @IBOutlet private weak var spaceshipNameTextField: UITextField?
    @IBOutlet weak var strengthValueLabel: UILabel!
    @IBOutlet weak var speedValueLabel: UILabel!
    @IBOutlet weak var capacityValueLabel: UILabel!
    @IBOutlet weak var strengthSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var capacitySlider: UISlider!
    
    var viewModel: AddSpaceshipViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
    }
    
    @IBAction private func strengthValueChanged(_ sender: UISlider) {
        viewModel?.strengthValueChanged(with: sender)
    }
    
    @IBAction private func speedValueChanged(_ sender: UISlider) {
        viewModel?.speedValueChanged(with: sender)
    }
    
    @IBAction private func capacityValueChanged(_ sender: UISlider) {
        viewModel?.capacityValueChanged(with: sender)
    }
    
    @IBAction private func saveButtonPressed(_ sender: UIButton) {
        viewModel?.saveSpaceship(name: spaceshipNameTextField?.text ?? "", strengthValue: Int(strengthSlider.value), speedValue: Int(speedSlider.value), capacityValue: Int(capacitySlider.value))
    }
}


extension AddSpaceshipViewController: AddSpaceshipViewModelDelegate {
    func handleViewModelOutput(_ output: AddSpaceshipViewModelOutput) {
        switch output {
        case .strengthChanged(let value):
            strengthValueLabel.text = "\(value)"
        case .speedChanged(let value):
            speedValueLabel.text = "\(value)"
        case .capacityChanged(let value):
            capacityValueLabel.text = "\(value)"
        case .save:
            break
        case .updateTitle(let value):
            totalPointLabel?.text = value
        }
    }
    
    func navigate(to route: AddSpaceshipRouter) {
        switch route {
        case .alert(let viewModel, let message):
            let viewController = AlertBuilder.make(with: viewModel, message: message)
            self.goToAlert(with: viewController)
        case .home(let viewModel):
            self.setRootViewController(viewController: BaseTabbarController(), from: "Home")
        }
    }
}
