//
//  Character.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import UIKit
import SpriteKit

enum AnimationState {
    case Idle, Walking, Dying
}

/*
    Character
    役割：移動処理
    　　　projectile property どこに置こう(BaseSpriteか？)
*/
class Character : BaseSprite {
    
    var movementSpeed: CGFloat = 50
    
    class var projectile: SKSpriteNode {
        get { return SharedSprites.sprites[spriteType]?[SharedSprites.Keys.projectile] ?? SKSpriteNode() }
        set {
            var spritesForCharType = SharedSprites.sprites[spriteType] ?? [String: SKSpriteNode]()
            spritesForCharType[SharedSprites.Keys.projectile] = newValue
            SharedSprites.sprites[spriteType] = spritesForCharType
        }
    }
    
    func move(byDeltaX dx: CGFloat, deltaY dy: CGFloat) {
        position.x += dx * movementSpeed; position.y += dy * movementSpeed
        requestedAnimation = AnimationState.Walking
    }
}













