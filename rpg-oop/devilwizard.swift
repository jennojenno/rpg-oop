//
//  devilwizard.swift
//  rpg-oop
//
//  Created by Amaya on 2/4/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic want", "Amulet", "Bacon"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}