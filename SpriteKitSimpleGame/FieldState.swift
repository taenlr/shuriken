//
//  FieldState.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/05.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

class FieldState: GameState {
    
    
    
    convenience init(level: Int) {
        self.init(gameState: GameState.State.Field, level: level)
    }
    
}