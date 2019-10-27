//
//  ViewController.swift
//  LQAppUtils
//
//  Created by Quan Li on 2019/10/16.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

class ViewController: AppBaseViewController{
    lazy var countButton = { () -> AppCountDownButton in
        let count = AppCountDownButton.init(title: "倒计时", font: UIFont.systemFont(ofSize: 15), normalColor: .red, textAlignment: .center)
        count.backgroundColor = .green
        count.frame = CGRect.init(x: 100, y: 100, width: 100, height: 30)
        count.count = 5
        count.delegate = self
        return count
    }()
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func clickButton(_ sender: Any) {
        
    }
    
    
    func aes(){
        let password = "UserPassword1!"
        let key128   = "1234567890123456"                   // 16 bytes for AES128
        //        let key256   = "12345678901234561234567890123456"   // 32 bytes for AES256
        let iv       = "abcdefghijklmnop"                   // 16 bytes for AES128
        
        guard let enData = password.aesEncrypt(key: key128, iv: iv) else{
            return
        }
        let enStr = enData.toHexString()
        print(enStr)
        let deStr = Data.init(hex: enStr).aesDecrypt(key: key128, iv: iv)
        print(deStr!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        countButton.stopCountDown()
    }
}

extension ViewController:AppCountDownDelegate{
    func clickCountDown(btn: AppCountDownButton) {
        btn.startCountDown()
    }
    func beginCountDown(btn: AppCountDownButton, count: Int) {
        btn.setTitle("\(count)s", for: .normal)
    }
    func countDowning(btn: AppCountDownButton, remainSecond: Int) {
        btn.setTitle("\(remainSecond)s", for: .normal)
    }
    func countDownComplete(btn: AppCountDownButton) {
        btn.setTitle("倒计时", for: .normal)
    }
}
