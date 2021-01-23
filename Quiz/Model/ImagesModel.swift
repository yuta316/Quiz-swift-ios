//
//  ImagesModel.swift
//  Quiz
//
//  Created by 石川裕太 on 2021/01/23.
//

import Foundation

//image class
class ImagesModel{
    
    let imageText:String?
    let answer:Bool?
    
    //initialize
    init(imageName:String, correctOrNot:Bool){
        imageText = imageName
        answer = correctOrNot
    }
    
    
    //画像名を取得して
    //画像名が人間かそうでないかフラグで判断する
}
