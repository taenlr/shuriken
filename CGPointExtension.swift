//
//  CGPointExtension.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/02.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import UIKit

/*
    CGFloat operators
*/
func += (inout dest: CGFloat, add: CGFloat) { dest = dest + add }
func -= (inout dest: CGFloat, add: CGFloat) { dest = dest - add }

/*
    CGPoint operators
*/
func + (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x + right.x, y: left.y + right.y) }
func - (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x - right.x, y: left.y - right.y) }
func * (point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x * scalar, y: point.y * scalar) }
func / (point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x / scalar, y: point.y / scalar) }

func += (inout dest: CGPoint, add: CGPoint) { dest.x += add.x; dest.y += add.y }


#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
    return sqrt(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
    
    func rotate(rad: CGFloat) -> CGPoint {
        return CGPoint(x: cos(rad)*self.x - sin(rad)*self.y, y: sin(rad)*self.x + cos(rad)*self.y)
    }
}
