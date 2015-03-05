//
//  Entity.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/04.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

func == (lhs: EntityID, rhs: EntityID) -> Bool { return lhs.hashValue == rhs.hashValue }

struct EntityID : Hashable {
    
    struct Constants {
        static let DummyEntityID = EntityID(id: UInt(888))
        static let NumOfMaxEntityID = UInt(500)
    }
    
    var val: UInt
    init(id: UInt) { self.val = id }
    var hashValue: Int {
        get { return (Int(val).hashValue) }
    }
}

/*
    Entity
    役割：ナンバリング
*/
class Entity: SKSpriteNode {
    var entityID = EntityID.Constants.DummyEntityID
    
    convenience override init() {
        self.init(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 0, height: 0))
    }
    
    convenience init(sprites: [SKSpriteNode]) {
        self.init(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 0, height: 0))
        
        // Entity オブジェクト配置
        for (childNumber, node) in enumerate(sprites) {
            addChild(node)
        }
    }
    
    struct NextValidID {
        static var val = UInt(0)
    }
    
    func getNewEntityID() -> EntityID {
        if(NextValidID.val >= EntityID.Constants.NumOfMaxEntityID) { assert(false, "Too many entities!") }
        return EntityID(id: NextValidID.val++)
    }
    
    func setNewValidIDToEntity(entity: Entity) {
        entity.entityID = getNewEntityID()
    }
}
