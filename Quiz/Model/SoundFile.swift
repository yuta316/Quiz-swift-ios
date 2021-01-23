//
//  SoundFile.swift
//  Quiz
//
//  Created by 石川裕太 on 2021/01/23.
//

import Foundation
import AVFoundation
//
class SoundFile{
    //プロパティ
    var player:AVAudioPlayer?
    
    func playSound(fileName:String, ext:String){
        //再生
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: ext)
        do{
           //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        }catch {
           print("error")
        }
    }
    
}
