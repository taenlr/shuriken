//
//  Slime.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

class Slime : Enemy {
    
    struct Constants {
        // UnitSpeed に対する相対的な速度
        static let movementSpeed = MovementSpeed(val: 1.0)
    }
    
    var AI: ArtificialIntelligence! = nil
    
    convenience init(position: CGPoint) {
        let atlas = SKTextureAtlas(named: "SlimeWalk")
        let atlasTexture = atlas.textureNamed("slime.png")
        
        self.init(texture: atlasTexture, atPosition: position)
        name = "Slime"
        
        AI = GoStraight(charInstance: self)
    }
    /*
    class func clone() -> Slime {
        return Slime()
    }
    */
    class func loadSharedAssets() {
        
    }
}