//
//  Config.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/02.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import UIKit

let regularFontName = "nukamiso2004"

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Player    : UInt32 = 0b001
    static let Enemy     : UInt32 = 0b010
    static let Projectile: UInt32 = 0b100
}


enum FieldStyle {
    case Plain, Cave, InSea, Castle
}

struct Constants {
    static let baseY = CGFloat(300)
}
