//
//  NextViewController.swift
//  Quiz
//
//  Created by 石川裕太 on 2021/01/23.
//

import UIKit
//プロコトル宣言
protocol nowScoreDelegate {
    func nowScore(score:Int)
}

class NextViewController: UIViewController {

    //正解数
    @IBOutlet weak var correctLabel: UILabel!
    //不正解数
    @IBOutlet weak var wrongLabel: UILabel!
    
    //デリゲートのインスタンス化
    var delegate:nowScoreDelegate?
    
    var correctCount = Int()
    var wrongCount = Int()
    var beforeCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctCount)
        wrongLabel.text = String(wrongCount)
        
        //最高得点の読み込み
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
        beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
    } 
    
    @IBAction func back(_ sender: Any) {
        
        //最高得点なら入れ替え
        if beforeCount < correctCount{
            //データの保存
            UserDefaults.standard.set(correctCount, forKey: "beforeCount")
            delegate?.nowScore(score: correctCount)
        }else if beforeCount > correctCount{
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        dismiss(animated: true, completion: nil)
    }
}
