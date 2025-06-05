//
//  SoundManager.swift
//  War
//
//  Created by Student17 on 05/06/2025.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static let instance = SoundManager()
    
    private var backgroundPlayer: AVAudioPlayer?
    private var effectPlayer: AVAudioPlayer?
    
    private init() {}
    
    func playBackgroundMusic(fileName: String, fileExtension: String, numberOfLoops: Int = -1) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("SoundManager: file \(fileName).\(fileExtension) not found")
            return
        }
        
        do {
            backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundPlayer?.numberOfLoops = numberOfLoops
            backgroundPlayer?.volume = 0.5
            backgroundPlayer?.prepareToPlay()
            print("SoundManager: playing Background music")
            backgroundPlayer?.play()
            
        } catch {
            print("Failed to play background music: \(error.localizedDescription)")
        }
    }
    
    func pauseBackgroundMusic(){
        print("SoundManager: pausing Background music")
        backgroundPlayer?.pause()
    }
    
    func resumeBackgroundMusic() {
        if let player = backgroundPlayer, !player.isPlaying {
            print("SoundManager: resuming Background music")
            player.play()
        }
    }
    
    func stopBackgroundMusic() {
        print("SoundManager: stopped Background music")
        backgroundPlayer?.stop()
        backgroundPlayer = nil
    }
    
    func playEffect(fileName: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("SoundManager: file \(fileName).\(fileExtension) not found")
            return
        }
        
        do {
            effectPlayer = try AVAudioPlayer(contentsOf: url)
            effectPlayer?.volume = 1.0
            effectPlayer?.prepareToPlay()
            print("SoundManager: play \(fileName).\(fileExtension) file")
            effectPlayer?.play()
        } catch {
            print("Failed to play background music: \(error.localizedDescription)")
        }
    }
    
    func pauseEffect(){
        effectPlayer?.pause()
    }
    
    func stopEffect() {
        effectPlayer?.stop()
        effectPlayer = nil
    }
}
