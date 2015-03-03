//
//  Enemy.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import Foundation

struct EnemyLife {
    var val: Int
    init() { val = 0 }
}

enum EnemyType {
    case Slime, Bat, Devil
}

class Enemy : Character {
    var life: EnemyLife
    var type: EnemyType
    
    init(type_: EnemyType) {
        life = EnemyLife()
        type = type_
        super.init()
    }
}