//
//  ViewController.swift
//  N
//
//  Created by 碓氷隼也 on 2017/08/02.
//  Copyright © 2017年 碓氷隼也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 起動した時点の時刻をmyLabelに反映
        myLabel.text = getNowTime()
        // 時間管理してくれる
        _ = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myDP: UIDatePicker!
    
    private var tempTime: String = "00:00"
    private var setTime: String = "00:00"
    
    @IBAction func myDPFunc(_ sender: Any) {
        // test print
        print("test: myDP moved!")
        // DPの値を成形
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        // 一時的にDPの値を保持
        tempTime = format.string(from: myDP.date)
    }
      
    @IBAction func myBFunc(_ sender: Any) {
        // アラームをセット
        setTime = tempTime
        // test print
        print("test: myButton Pushed!")
    }
       
    func getNowTime()-> String {
        // 現在時刻を取得
        let nowTime: NSDate = NSDate()
        // 成形する
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let nowTimeStr = format.string(from: nowTime as Date)
        // 成形した時刻を文字列として返す
        return nowTimeStr
    }
    
    func update() {
        // 現在時刻を取得
        let str = getNowTime()
        // myLabelに反映
        myLabel.text = str
        // アラーム鳴らすか判断
        myAlarm(str: str)
    }
    
    func myAlarm(str: String) {
        // 現在時刻が設定時刻と一緒なら
        if str == setTime{
            alert()
        }
    }
    
    // アラートの表示
    func alert() {
        let myAlert = UIAlertController(title: "寝ろ", message: "時間です", preferredStyle: .alert)
        let myAction = UIAlertAction(title: "はい", style: .default) {
            action in print("foo!!")
        }
        myAlert.addAction(myAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    
}
