//
//  enemy.swift
//  rpg-oop
//
//  Created by Amaya on 2/4/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty Dagger", "Jeweled Sword"]
    }
    
    var type: String {
        return "Gnome"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            //arc4random_uniform requires a UInt32.
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            //I want a random number between 0 and the length of loot array
            //Returns int, converts into UInt32, and gives us a random # 
            //Then we need to convert it back into Int (beginning Int statement)

            return loot[rand]
        }
        
        return nil
    }
}