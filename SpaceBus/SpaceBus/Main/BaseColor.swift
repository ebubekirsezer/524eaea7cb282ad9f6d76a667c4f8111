//
//  BaseColor.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import UIKit

protocol BaseColorProtocol {
    var PrimaryColor: UIColor? { get set}
    var TextOnPrimaryColor: UIColor? { get set }
}

final class BaseColor: BaseColorProtocol {
    
    public static var shared = BaseColor()
    
    var PrimaryColor: UIColor? = #colorLiteral(red: 0.05490196078, green: 0.06274509804, blue: 0.168627451, alpha: 1)
    var TextOnPrimaryColor: UIColor? = .white
}

