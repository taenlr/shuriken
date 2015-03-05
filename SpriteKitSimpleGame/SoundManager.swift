//
//  SoundManager.swift
//  SpriteKitSimpleGame
//
//  Created by moti on 2015/03/03.
//  Copyright (c) 2015年 RoW. All rights reserved.
//

import Foundation
import AVFoundation
import SpriteKit

class SoundManager {
    var backgroundMusicPlayer: AVAudioPlayer!
    let scene: GameScene
    
    init() { scene = GameScene() }
    init(scene_: GameScene) { scene = scene_ }
    
    enum SEStyle {
        case Throw, Hit
    }
    
    struct Constants {
        static let fnameBGMField = "fieldbgm.caf"
        static let fnameSEThrow  = "throw.caf"
        static let fnameSEHit = "hit.caf"
    }
    
    func playBGM(fstyle: FieldStyle) {
        
        var fname: String
        switch fstyle {
        case FieldStyle.Plain:
            fname = Constants.fnameBGMField
        default:
            fname = Constants.fnameBGMField
        }
        
        let url = NSBundle.mainBundle().URLForResource(fname, withExtension: nil)
        if url == nil { println("File not found \(fname)"); return }
        var error: NSError? = nil
        backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        if backgroundMusicPlayer == nil {
            println("Could not create audio player: \(error)")
            return
        }
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }
    
    func playSound(sestyle: SEStyle) {
        
        var fname: String
        switch sestyle {
        case SEStyle.Throw:
            fname = Constants.fnameSEThrow
        case SEStyle.Hit:
            fname = Constants.fnameSEHit
        default:
            fname = Constants.fnameSEThrow
        }
        
        scene.runAction(SKAction.playSoundFileNamed(fname, waitForCompletion: false))
    }
}










