//
//  GameState.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/02.
//  Copyright (c) 2015年 RoW. All rights reserved.
//


class GameState {
    
    enum State {
        case Opening, GameOver
        case Field, Boss
    }
    
    var gameState: State
    var level: Int
    
    init(gameState: State, level: Int) {
        self.gameState = gameState
        self.level = level
    }
    
}