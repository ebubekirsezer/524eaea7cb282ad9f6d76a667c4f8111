//
//  Spaceship.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation

class Spaceship: Codable {
    var name: String?
    var coordinateX: Float?
    var coordinateY: Float?
    var capacity: Int?
    var stock: Int?
    var need: Int?
    var isFavorite: Bool?
    var isTraveled: Bool?
    
    init(name: String?, coordinateX: Float?, coordinateY: Float?, capacity: Int?, stock: Int?, need: Int?, isFavorite: Bool? = false) {
        self.name = name
        self.coordinateX = coordinateX
        self.coordinateY = coordinateY
        self.capacity = capacity
        self.stock = stock
        self.need = need
        self.isFavorite = isFavorite
    }
    
    public var dictionary: [String: Any?]{
        get {
            return [
                "name": name,
                "coordinateX": coordinateX,
                "coordinateY": coordinateY,
                "capacity": capacity,
                "stock": stock,
                "need": need
            ]
        }
    }
}
