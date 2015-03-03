//
//  Player.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/02.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import Foundation

struct Player {

    func getScore(target: UInt32) -> Int {
        switch target {
        case PhysicsCategory.Monster:
            return 20
        default:
            return 893
        }
    }
}