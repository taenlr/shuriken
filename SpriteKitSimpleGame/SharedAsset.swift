//
//  SharedAsset.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/05.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

protocol SharedAssetProvider {
    class func loadSharedAssets()
}

enum SpriteType {
    case Land
    case Player, Slime, Bat, Devil, Boss
}

func inferSpriteType(fromType: BaseSprite.Type) -> SpriteType {
    switch fromType {
    case is Player.Type:
        return SpriteType.Player
    case is Slime.Type:
        return SpriteType.Slime
    default:
        return SpriteType.Boss
    }
}

struct SharedTextures {
    struct Keys {
        static let idle = "textures.idle"
        static let walking = "textures.walking"
        static let attack = "textures.attack"
        static let hit = "textures.hit"
        static let dying = "textures.dying"
    }
    
    static var textures = [SpriteType: [String:[SKTexture]]]()
}

struct SharedSprites {
    struct Keys {
        static let projectile = "textures.projectile"
//        static let deathSplort <- ナニコレ珍百景
    }
    
    static var sprites = [SpriteType: [String:SKSpriteNode]]()
}
