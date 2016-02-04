//
//  ViewController.swift
//  rpg-oop
//
//  Created by Amaya on 2/4/16.
//  Copyright © 2016 Amaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHpLabel: UILabel!
    @IBOutlet weak var enemyHpLabel: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    @IBOutlet weak var enemy2Img: UIImageView!
    
    //We will def have a player and enemy so !
    var player: Player!
    var enemy: Enemy!
    //Even if I wanted a chimera, I can start with type Enemy and initialize a chimera
    
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Gizmo", hp: 110, attackPwr: 23)
        playerHpLabel.text = "\(player.hp) HP"
        
        generateRandomEnemy()
        enemyHpLabel.text = "\(enemy.hp) HP"
    }
    
    //Want to generate a random enemy: 
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Chimera(startingHp: 50, attackPwr: 12)
            enemyImg.hidden = false
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
            enemy2Img.hidden = false
        }
        
        enemyHpLabel.text = "\(enemy.hp) HP"
    }
    
    @IBAction func onChestClick(sender: AnyObject) {
        chestBtn.hidden = true
        printLabel.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }
    @IBAction func attackClicked(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attack Unsuccessful"
        }
        
        //We're using "if let" here because the enemy might not drop any loot (nil!).
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
            enemy2Img.hidden = true
        }
    }
}

