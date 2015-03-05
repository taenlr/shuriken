//
//  Player.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

struct PlayerLife {
    var val: Int = 3
}

/*
    Player
    役割：
*/
class Player : Character {

    var life = PlayerLife()
    /*
    class func clone() -> Player {
        return Player()
    }
    */
    
    convenience init(position: CGPoint) {
        let atlas = SKTextureAtlas(named: "PlayerWalk")
        let atlasTexture = atlas.textureNamed("player.png")
        
        self.init(texture: atlasTexture, atPosition: position)
        name = "Player"
    }
    
    override func configurePhysicsBody() {
        // 自機の剛体定義
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.dynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.Player
        physicsBody?.contactTestBitMask = PhysicsCategory.Enemy
        physicsBody?.collisionBitMask = PhysicsCategory.None
        physicsBody?.usesPreciseCollisionDetection = true    // 通過を衝突とみなす
    }
}