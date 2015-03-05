//
//  GoStraight.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import Foundation
import UIKit

class GoStraight : ArtificialIntelligence {
    
    override func updateWithTimeSinceLastUpdate() {
        charInstance.position.x -= charInstance.movementSpeed
    }
}