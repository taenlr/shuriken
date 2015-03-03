//
//  GameState.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/02.
//  Copyright (c) 2015年 RoW. All rights reserved.
//


class GameState {
    
    enum GState {
        case Opening, GameOver
        case Field, Boss
    }
    
    var gstate: GState
    var level:  Int
    
    init(gstate_: GState, level_: Int) {
        gstate = gstate_
        level = level_
    }
    
}