//
//  ViewController.swift
//  Quiz
//
//  Created by 石川裕太 on 2021/01/23.
//

import UIKit

class ViewController: UIViewController, nowScoreDelegate {
    //Quiz画像
    @IBOutlet weak var imageView: UIImageView!
    //最高得点表示ラベル
    @IBOutlet weak var MaxScoreLabl: UILabel!
    
    //モデルのインスタンス化
    let imagesList = ImagesList()
    //検知した答えがoかxかを格納
    var pickedAnswer = false
    
    var soundFile = SoundFile()
    
    //正解数
    var correctCount = 0
    //不正解数
    var wrongCount = 0
    //最高正解数
    var maxNum = 0
    //質問数
    var questionNumber=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像の角丸める
        imageView.layer.cornerRadius = 20.0
    }
    //戻ってきた時
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        correctCount=0
        wrongCount=0
        questionNumber=0
        //viewに見せる画像
        imageView.image = UIImage(named: imagesList.list[0].imageText!)
        
        //max取り出し(ある時のみないときは0)
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            maxNum = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        //maxに反映
        MaxScoreLabl.text = String(maxNum)
    }
    
    
    
    //o,xの遷移と対応
    @IBAction func Answer(_ sender: Any) {
        //oの時
        if (sender as AnyObject).tag == 1{
            //usetが押したボタンがoだった
            pickedAnswer = true
            //oボタンの音声を流す
            soundFile.playSound(fileName:"maruSound", ext:"mp3")
            
        }
        //xの時
        else if (sender as AnyObject).tag == 2{
            //usetが押したボタンがxだった
            pickedAnswer = false
            //xボタンの音声を流す
            soundFile.playSound(fileName: "batsuSound", ext: "mp3")

        }
        //正解か不正解か
        check()
        //次の問題or画面遷移
        nextQuetions()
    }
    //回答チェック
    func check(){
        let correctAnswer = imagesList.list[questionNumber].answer
        //正解なら
        if correctAnswer==pickedAnswer{
            print("Correct")
            correctCount+=1
        }else{
            print("Wrong")
            wrongCount+=1
        }
    }
    //
    func nextQuetions(){
        if questionNumber <= 9{
            questionNumber+=1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText!)
        }else{
            //問題が終了すれば画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    //delegateメソッド実装
    func nowScore(score: Int) {
        MaxScoreLabl.text = String(score)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.correctCount = correctCount
            nextVC.wrongCount = wrongCount
            print(correctCount,wrongCount)
            
            nextVC.delegate = self
        }
    }

}

