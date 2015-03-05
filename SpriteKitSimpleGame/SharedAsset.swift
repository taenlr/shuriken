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

enum CharacterType {
    case Player, Slime, Bat, Devil, Boss
}

func inferCharacterType(fromType: Character.Type) -> CharacterType {
    switch fromType {
    case is Player.Type:
        return CharacterType.Player
    case is Slime.Type:
        return CharacterType.Slime
    default:
        return CharacterType.Boss
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
    
    static var textures = [CharacterType: [String:[SKTexture]]]()
}

struct SharedSprites {
    struct Keys {
        static let projectile = "textures.projectile"
//        static let deathSplort <- ナニコレ珍百景
    }
    
    static var sprites = [CharacterType: [String:SKSpriteNode]]()
}
