//
//  character.swift
//  rpg-oop
//
//  Created by Amaya on 2/4/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import Foundation

class Character {
    
    //keep these private bc we don't want anyone to mess with it willy-nilly:
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        return _attackPwr
    }
    
    var hp: Int {
        return _hp
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
        //self refers to global version, this is for local scope
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
    
}