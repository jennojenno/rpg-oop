//
//  player.swift
//  rpg-oop
//
//  Created by Amaya on 2/4/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        _name = name
    }
}