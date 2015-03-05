//
//  Enemy.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

struct EnemyLife {
    var val: Int
    init() { val = 0 }
}

class Enemy : Character {
    
    var life = EnemyLife()
    
    override func configurePhysicsBody() {
        // 敵の剛体定義
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.dynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.Enemy
        physicsBody?.contactTestBitMask = PhysicsCategory.Projectile
        physicsBody?.collisionBitMask = PhysicsCategory.None
    }
}
