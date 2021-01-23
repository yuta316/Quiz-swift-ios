//
//  withoutMP3.swift
//  Quiz
//
//  Created by 石川裕太 on 2021/01/23.
//

import Foundation

class sound: SoundFile{
    
    override func playSound(fileName: String, ext: String) {
    /*
        if ext == "mp3"{
            print("cant play")
        }*/
        player?.stop()
    }
}
