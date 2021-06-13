//
//  HomeViewModel.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate?
    
    private var spaceships: [Spaceship]?
    private var filteredSpaceships: [Spaceship] = []
    
    func load() {
        notify(.setLoading(true))
        notify(.updateNavigationTitle("Home"))
        
        SpacebusService.shared.fetchSpaceships { result in
            switch result {
            case .success(let spaceships):
                self.notify(.setLoading(false))
                self.spaceships = spaceships
                self.notify(.setSpaceships(spaceships))
            case .failure(let error):
                self.notify(.setLoading(false))
                let viewModel = AlertViewModel()
                self.delegate?.navigate(to: .alert(viewModel, "An Network error happen"))
                print(error.localizedDescription)
            }
        }
        
        setInformations()
    }
    
    func filterSpaceships(with text: String) -> [Spaceship] {
        filteredSpaceships = []
        filteredSpaceships = spaceships?.filter({ $0.name!.lowercased().contains(text.lowercased()) }) ?? []
        
        return filteredSpaceships
    }
    
    private func setInformations() {
        let name = UserDefaults.standard.string(forKey: Constants.USER_DEFAULTS_SHIP_NAME) ?? ""
        let dsStrength = UserDefaults.standard.integer(forKey: Constants.USER_DEFAULTS_STRENGTH) * 10000
        let eusSpeed = UserDefaults.standard.integer(forKey: Constants.USER_DEFAULTS_SPEED) * 20
        let ugsCapacity = UserDefaults.standard.integer(forKey: Constants.USER_DEFAULTS_Capacity) * 10000
        let shipName = name
        let ugs = "UGS: \(ugsCapacity)"
        let eus = "EUS: \(eusSpeed)"
        let ds = "DS: \(dsStrength)"
        let time = dsStrength / 1000
        let damage = ugsCapacity / 100
        
        notify(.setInformations(name: shipName, ugs: ugs, eus: eus, ds: ds, damage: "\(damage)", time: "\(time)"))
    }
    
    private func notify(_ output: HomeViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
