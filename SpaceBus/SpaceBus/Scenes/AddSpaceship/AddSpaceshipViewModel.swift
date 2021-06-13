//
//  AddSpaceshipViewModel.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

final class AddSpaceshipViewModel: AddSpaceshipViewModelProtocol {
    
    weak var delegate: AddSpaceshipViewModelDelegate?
    
    private var allScore: Int = 15
    private var totalScore: Int = 0
    private var strengthValue: Int = 0
    private var speedValue: Int = 0
    private var capacityValue: Int = 0
    
    private var alertViewModel: AlertViewModel!
    
    init() {
        alertViewModel = AlertViewModel()
    }
    
    func load() {
        let title = "Dağıtılacak Puan: \(allScore)"
        notify(.updateTitle(title))
    }

    func saveSpaceship(name: String, strengthValue: Int, speedValue: Int, capacityValue: Int) {
        
        totalScore = strengthValue + speedValue + capacityValue
        
        if name.isEmpty {
            delegate?.navigate(to: .alert(alertViewModel, "Uzay Gemisi İsmi Boş Bırakılamaz!"))
        } else if strengthValue == 0 {
            delegate?.navigate(to: .alert(alertViewModel, "Dayanıklılık Değeri 0 olamaz!!"))
        } else if speedValue == 0 {
            delegate?.navigate(to: .alert(alertViewModel, "Hız Değeri 0 olamaz!!"))
        } else if capacityValue == 0 {
            delegate?.navigate(to: .alert(alertViewModel, "Kapasite Değeri 0 olamaz!!"))
        } else if totalScore > 15 {
            delegate?.navigate(to: .alert(alertViewModel, "Toplam Puan 15'den fazla olamaz!!"))
        } else if totalScore < 15 {
            delegate?.navigate(to: .alert(alertViewModel, "Toplam Puan 15'den az olamaz!!"))
        } else {
            UserDefaults.standard.setValue(name, forKey: Constants.USER_DEFAULTS_SHIP_NAME)
            UserDefaults.standard.setValue(strengthValue, forKey: Constants.USER_DEFAULTS_STRENGTH)
            UserDefaults.standard.setValue(speedValue, forKey: Constants.USER_DEFAULTS_SPEED)
            UserDefaults.standard.setValue(capacityValue, forKey: Constants.USER_DEFAULTS_Capacity)
            let homeViewModel = HomeViewModel()
            delegate?.navigate(to: .home(homeViewModel))
        }
    }
    
    func strengthValueChanged(with sender: UISlider) {
        self.allScore = 15 - Int(sender.value) - speedValue - capacityValue
        var title = ""
        if allScore <= 0 {
            delegate?.navigate(to: .alert(alertViewModel, "Toplam Puan 0'dan küçük olamaz!"))
            title = "Dağıtılacak Puan: \(0)"
        } else {
            self.strengthValue = Int(sender.value)
            title = "Dağıtılacak Puan: \(allScore)"
        }
        notify(.strengthChanged(Int(sender.value)))
        notify(.updateTitle(title))
    }
    
    func speedValueChanged(with sender: UISlider) {
        self.allScore = 15 - Int(sender.value) - strengthValue - capacityValue
        var title = ""
        if allScore <= 0 {
            delegate?.navigate(to: .alert(alertViewModel, "Toplam Puan 0'dan küçük olamaz!"))
            title = "Dağıtılacak Puan: \(0)"
        } else {
            self.speedValue = Int(sender.value)
            title = "Dağıtılacak Puan: \(allScore)"
        }
        notify(.speedChanged( Int(sender.value)))
        notify(.updateTitle(title))
    }
    
    func capacityValueChanged(with sender: UISlider) {
        self.allScore = 15 - Int(sender.value) - strengthValue - speedValue
        var title = ""
        if allScore <= 0  {
            delegate?.navigate(to: .alert(alertViewModel, "Toplam Puan 0'dan küçük olamaz!"))
            title = "Dağıtılacak Puan: \(0)"
        } else {
            self.capacityValue = Int(sender.value)
            title = "Dağıtılacak Puan: \(allScore)"
        }
        notify(.capacityChanged(Int(sender.value)))
        notify(.updateTitle(title))

    }
    
    
    private func notify(_ output: AddSpaceshipViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
