//
//  chimera.swift
//  rpg-oop
//
//  Created by Amaya on 2/4/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import Foundation

class Chimera: Enemy {
    //He has an immunity: Any attack less than 15 doesn't work, and adds 1 HP to his life
    
    let IMMUNE_MAX = 15
    
    //Since the chimera is stronger, it will drop more valuable loot. 
    //Let's override the original "loot" in enemy with better loot! 
    //This is polymorphism:  defining functions in different ways
    
    override var loot: [String] {
        return ["Tough hide", "Chimera venom", "Rare trident"]
    }
    
    override var type: String {
        return "Chimera"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        //in Character.swift, attemptAttack will never be called since we're overriding it. 
        //But we still need the code without repeating it
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
            //Remember, super calls the top level class (Character) 
            //then we can call its function within it like an attribute with .attemptAttack
        } else {
            return false
            //meaning attack was not successful
        }
    }
}