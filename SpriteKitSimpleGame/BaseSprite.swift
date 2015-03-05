//
//  BaseSprite.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/05.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

class BaseSprite: SKSpriteNode {
    
    var requestedAnimation = AnimationState.Walking
    var isDying = false
    var canResolveAnime = true
    let animeSpeed: CGFloat = 1.0/40.0

    class var spriteType: SpriteType { return inferSpriteType(self) }

    class var idleAnimation: [SKTexture] {
        get { return SharedTextures.textures[spriteType]?[SharedTextures.Keys.idle] ?? [] }
        set {
            var anime = SharedTextures.textures[spriteType] ?? [String: [SKTexture]]()
            anime[SharedTextures.Keys.idle] = newValue
            SharedTextures.textures[spriteType] = anime
        }
    }

    class var walkingAnimation: [SKTexture] {
        get { return SharedTextures.textures[spriteType]?[SharedTextures.Keys.walking] ?? [] }
        set {
            var animeFramesForCharType = SharedTextures.textures[spriteType] ?? [String: [SKTexture]]()
            animeFramesForCharType[SharedTextures.Keys.walking] = newValue
            SharedTextures.textures[spriteType] = animeFramesForCharType
        }
    }
    
    class var dyingAnimation: [SKTexture] {
        get { return SharedTextures.textures[spriteType]?[SharedTextures.Keys.dying] ?? [] }
        set {
            var animeFramesForCharType = SharedTextures.textures[spriteType] ?? [String: [SKTexture]]()
            animeFramesForCharType[SharedTextures.Keys.dying] = newValue
            SharedTextures.textures[spriteType] = animeFramesForCharType
        }
    }

    convenience init(sprites: [SKSpriteNode], atPosition position: CGPoint) {
        self.init(sprites: sprites, atPosition: position)
        sharedInitAtPosition(position)
    }
    
    convenience init(texture: SKTexture?, atPosition position: CGPoint) {
        let size = texture != nil ? texture!.size() : CGSize(width: 0, height: 0)
        self.init(texture: texture, color: SKColor.whiteColor(), size: size)
        sharedInitAtPosition(position)
    }
    
    func sharedInitAtPosition(position: CGPoint) {
        self.position = position
        configurePhysicsBody()
    }
    
    func configurePhysicsBody() {}
    
    func performDeath() {
        isDying = true
        requestedAnimation = AnimationState.Dying
    }
    
    func animationFramesAndKeyForState(state: AnimationState) -> ([SKTexture], String) {
        switch state {
        case .Walking: return (self.dynamicType.walkingAnimation, "WalkingAnime")
        case .Dying:   return (self.dynamicType.dyingAnimation, "DyingAnime")
        default:
            return (self.dynamicType.idleAnimation, "IdleAnime")
        }
    }
    
    /*
        updateWithTimeSinceLastUpdate(interval: NSTimeInterval)
        役割：スプライト描画処理（インターフェース）
        備考：クラスを跨いで関数の命名を統一している
    */
    func updateWithTimeSinceLastUpdate(interval: NSTimeInterval) {
        if !canResolveAnime { return }
        resolveRequestedAnimation()
    }
    
    func animationDidComplete(state: AnimationState) {}
    
    func animationHasCompleted(state: AnimationState) {
        canResolveAnime = false
        animationDidComplete(state)
    }
    
    func resolveRequestedAnimation() {
        let animeState = requestedAnimation
        var (frames, key) = animationFramesAndKeyForState(animeState)
        doAnimeForState(animeState, usingTextures: frames, withKey: key)
    }
    
    func doAnimeForState(state: AnimationState, usingTextures frames: [SKTexture], withKey key: String) {
        var animeAct = actionForKey(key)
        if animeAct != nil   { return }
        if frames.count < 1 { return }
        
        let anime = SKAction.animateWithTextures(frames, timePerFrame: NSTimeInterval(animeSpeed))
        runAction(SKAction.sequence([anime, SKAction.runBlock({self.animationHasCompleted(state)})]), withKey: key)
    }
    
}
