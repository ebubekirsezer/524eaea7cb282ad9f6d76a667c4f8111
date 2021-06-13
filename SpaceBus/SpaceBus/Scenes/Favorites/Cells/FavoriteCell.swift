//
//  FavoriteCell.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var detailLabel: UILabel?
    @IBOutlet private weak var favoriteButton: UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(with ship: Spaceship) {
        titleLabel?.text = ship.name
        detailLabel?.text = "\((ship.capacity ?? 0) * 20) EUS"
    }
    
}
