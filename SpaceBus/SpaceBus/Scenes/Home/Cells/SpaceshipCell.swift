//
//  SpaceshipCell.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

class SpaceshipCell: UICollectionViewCell {

    @IBOutlet private weak var spaceshipTitleLabel: UILabel?
    @IBOutlet private weak var detailLabel: UILabel?
    @IBOutlet private weak var subtitleLabel: UILabel?
    @IBOutlet private weak var favoriteButton: UIButton?
    @IBOutlet private weak var travelButton: UIButton?
    
    weak var delegate: HomeViewController?
    private var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with ship: Spaceship?, index: Int) {
        self.index = index
        if ship?.isFavorite ?? false {
            favoriteButton?.setImage(UIImage(named: "star"), for: .normal)
        } else {
            favoriteButton?.setImage(UIImage(named: "emptyStar"), for: .normal)
        }
                
        let speed = UserDefaults.standard.value(forKey: Constants.USER_DEFAULTS_SPEED) as! Int
        spaceshipTitleLabel?.text = ship?.name ?? ""
        detailLabel?.text = "\(ship?.stock ?? 0)/\(ship?.need ?? 0)"
        subtitleLabel?.text = "\(speed * 20)"
    }

    @IBAction private func starPressed(_ sender: UIButton) {
        if let index = index {
            if let ship = delegate?.filteredSpaceships?[index] {
                ship.isFavorite = !(ship.isFavorite ?? false)
                sender.setImage((ship.isFavorite ?? false) ? UIImage(named: "star") : UIImage(named: "emptyStar"), for: .normal)
                
                if ship.isFavorite ?? false {
                    
                    HomeViewController.favorites?.append(ship)
                } else {
                    HomeViewController.favorites?.remove(at: index)
                }
            }
        }
    }
    
    @IBAction private func travelPressed(_ sender: UIButton) {
        if let index = index {
            if let ship = delegate?.filteredSpaceships?[index] {
                ship.isTraveled = !(ship.isTraveled ?? false)
                if ship.isTraveled ?? false {
                    sender.backgroundColor = .gray
                    sender.isEnabled = false
                } else {
                    sender.isEnabled = true
                }
            }
        }
    }
}
