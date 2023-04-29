//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["Appleの2022年現在のCEOの名前は？", "スティーブ・ジョブズ", "ティム・クック", "ジョナサン・アイブ", 2])
        quizArray.append(["初代iPodの発売年は？", "2000年", "2001年", "2002年", 2])
        quizArray.append(["Siriの技術はもともとアメリカのある大手研究機関が開発しました。その研究機関を設立したアメリカの大学は？", "ハーバード大学", "マサチューセッツ工科大学", "スタンフォード大学", 3])
        quizArray.append(["Apple社の本社はアメリカの何州にあるのか？", "カリフォルニア州", "フロリダ州", "ワシントン州", 1])
        quizArray.append(["Siriが初めて搭載されたiPhoneの機種は？", "iPhone4", "iPhone4S", "iPhone5", 2])
        quizArray.append(["iPhoneSEの第１世代の発売年は？", "2010年", "2013年", "2016年", 3])
        quizArray.append(["初代iPhoneの発売年は？", "2006年", "2007年", "2008年", 2])
        quizArray.append(["カメラに初めてフラッシュ機能が追加されたiPhoneの機種は？", "iPhone4", "iPhone5", "iPhone6", 1])
        quizArray.append(["iPhoneが日本に初登場した年は？", "2006年", "2008年", "2010年", 2])
        quizArray.append(["iPhoneを日本国内で最初に発売したキャリアは？", "au", "NTTドコモ", "ソフトバンク", 3])
        //------------------------ここから上にクイズを書く------------------------//
        
        //quizArrayの中身をシャッフルする
        quizArray.shuffle()

        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


