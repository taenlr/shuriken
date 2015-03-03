//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/02.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let player = SKSpriteNode(imageNamed: "player")
    let scoreLabel = SKLabelNode(fontNamed: regularFontName)
    let soundMgr = SoundManager()
    let gameState: GameState
    
    override func didMoveToView(view: SKView) {
        
        // 自弾の剛体定義
        player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size)
        player.physicsBody?.dynamic = true
        player.physicsBody?.categoryBitMask = PhysicsCategory.Player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.Enemy
        player.physicsBody?.collisionBitMask = PhysicsCategory.None
        player.physicsBody?.usesPreciseCollisionDetection = true    // 通過を衝突とみなす
        
        backgroundColor = SKColor.whiteColor()
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addEnemy),
                SKAction.waitForDuration(1.0)
                ])
        ))
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        
        soundMgr.playBGM(FieldStyle.Plain)
    }
    
    func projectileDidCollideWithEnemy(projectile:SKSpriteNode, enemy: SKSpriteNode) {
        soundMgr.playSound(self, sestyle: SoundManager.SEStyle.Hit)
        projectile.removeFromParent()
        enemy.removeFromParent()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        firstBody = contact.bodyA; secondBody = contact.bodyB
        if firstBody.categoryBitMask > secondBody.categoryBitMask { swap(&firstBody, &secondBody) }
        
        // 敵と自弾の衝突判定
        if firstBody.categoryBitMask & PhysicsCategory.Enemy != 0
            && secondBody.categoryBitMask & PhysicsCategory.Projectile != 0 {
                projectileDidCollideWithEnemy(
                    secondBody.node as SKSpriteNode,
                    enemy: firstBody.node as SKSpriteNode)
        }
        
        // プレイヤーと敵の衝突
        if firstBody.categoryBitMask & PhysicsCategory.Player != 0
            && secondBody.categoryBitMask & PhysicsCategory.Enemy != 0 {
                // ゲームオーバー
                let loseAction = SKAction.runBlock() {
                    let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                    let gameOverScene = GameOverScene(size: self.size)
                    self.view?.presentScene(gameOverScene, transition: reveal)
                }
                runAction(loseAction)
        }
        
    }
    
    func addEnemy() {
        let enemy = SKSpriteNode(imageNamed: "enemy")
        
        // 敵の剛体定義
        enemy.physicsBody = SKPhysicsBody(rectangleOfSize: enemy.size)
        enemy.physicsBody?.dynamic = true
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.Enemy
        enemy.physicsBody?.contactTestBitMask = PhysicsCategory.Projectile
        enemy.physicsBody?.collisionBitMask = PhysicsCategory.None
        
        let actualY = Misc.random(enemy.size.height*2, max: size.height - enemy.size.height*2)
        
        enemy.position = CGPoint(x: size.width+enemy.size.width/2, y: actualY)
        
        addChild(enemy)
        let actualDuration = Misc.random(CGFloat(2.0), max: CGFloat(4.0))
        
        let actionMove = SKAction.moveTo(CGPoint(x: -enemy.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        enemy.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        soundMgr.playSound(self, sestyle: SoundManager.SEStyle.Hit)
        
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        let projectile = SKSpriteNode(imageNamed: "projectile")
        projectile.position = player.position
        
        // 自弾の剛体定義
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/3.0) // 半径より少し小さい
        projectile.physicsBody?.dynamic = true
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.Projectile
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.Enemy
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.None
        projectile.physicsBody?.usesPreciseCollisionDetection = true    // 通過を衝突とみなす
        
        let offset = touchLocation - projectile.position
        
        // 後ろには投げれない
        if offset.x < 0 { return }
        
        addChild(projectile)
        
        let tarDir = offset.normalized()
        let target = tarDir*125 + projectile.position
        let polDir = tarDir.rotate(CGFloat(M_PI_2)).normalized()
        
        let tarDirMove = SKAction.moveTo(target, duration: 0.3)
        
        let polDirMove = SKAction.moveTo(polDir*20  + target, duration: 0.1)
        
        let roll = SKAction.rotateByAngle(CGFloat(M_PI*2.0), duration: 0.3)
        projectile.runAction(SKAction.repeatActionForever(roll))
        
        projectile.runAction(SKAction.sequence([
            tarDirMove,
            polDirMove,
            SKAction.group([
                SKAction.moveTo(player.position, duration: 0.3),
                SKAction.speedTo(1.5, duration: 0.3),
                SKAction.fadeOutWithDuration(0.3)
                ]),
            SKAction.removeFromParent()
            ]))
        
    }
    
}