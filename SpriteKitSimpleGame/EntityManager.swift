//
//  EntityManager.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import Foundation

/*
    EntityManager
    役割：[EnitityID:Entity] の管理
*/
class EntityManager {
    
    var entities = [EntityID:Entity]()
    
    func registerEntity(entity: Entity) {
        entities[entity.entityID] = entity
    }
    
    func removeEntity(id: EntityID) {
        entities.removeValueForKey(id)
    }
    
}