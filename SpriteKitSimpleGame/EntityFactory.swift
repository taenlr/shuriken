//
//  EntityFactory.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import Foundation
import SpriteKit

class EntityFactory {
    
    let entMgr: EntityManager
    let scene:  GameScene
    
    init(entMgr: EntityManager, scene: GameScene) {
        self.entMgr = entMgr
        self.scene  = scene
    }
    /*
    func createPlayer() -> Player {
        let player = Player.clone()
        player.setNewValidIDToEntity(player)
        
        //let sprite = SKScene(fileNamed: Player.Constants.spriteName)
        let position = CGPoint(x: scene.size.width*0.1, y: BaseY)
    
        // 各種設定
        // ...
        return player
    }
    
    func createSlime() -> Slime {
        let sprite = SKSpriteNode(imageNamed: "slime")
        var position = CGPoint(x: scene.size.width+sprite.size.width/2, y: BaseY)
        createEnemySprite(sprite, type: EnemyType.Slime, position: position)
        
        let slime = Slime.clone()
        // 各種設定
        // ...
        // // return Slime(position_: position, type_: EnemyType.Slime)
        return slime
    }
*/

}