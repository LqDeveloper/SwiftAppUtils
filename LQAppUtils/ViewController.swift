//
//  ViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/10/16.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit
import CommonCrypto
class ViewController: AppBaseViewController{
    lazy var countButton = { () -> AppCountDownButton in
        let count = AppCountDownButton.init(title: "倒计时", font: UIFont.systemFont(ofSize: 15), normalColor: .red)
        count.backgroundColor = .green
        count.frame = CGRect.init(x: 100, y: 100, width: 100, height: 30)
        count.count = 5
        count.delegate = self
        return count
    }()
    
    var observer = AppKeyboardObserver.init()
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIColor.red.hexString("0x"))
        print(UIColor.green.hexString)
        //        navigationController?.navigationBar.isTranslucent = false
        //        navigationController?.navigationBar.barTintColor = .green
        //        let status = AppKeychainManager.save(service: "demo.williamoneil.com", account: "13818713453", password: "123456").checkStatus
        //        print(status.rawValue)
        //        observer.delegate = self
        //        textField.textType = .password
        //
        //        debugPrint("\n这是".hasChinese)
        //        print(AppDeviceInfo.statusBarHeight)
        //        print("?name=demo&age=10".queryParameters!)
        
        checkNotificationEnable { (isSuccess) in
            print(isSuccess)
        }
        print("1234".encrypt(.md5))
        print("1234".encrypt(.sha1))
        print("1234".encrypt(.sha224))
        print("1234".encrypt(.sha256))
        print("1234".encrypt(.sha384))
        print("1234".encrypt(.sha512))
        print("-----------")
        
        print("1234".hmacEncrypt(type: .md5, key: "key"))
        print("1234".hmacEncrypt(type: .sha1, key: "key"))
        print("1234".hmacEncrypt(type: .sha224, key: "key"))
        print("1234".hmacEncrypt(type: .sha256, key: "key"))
        print("1234".hmacEncrypt(type: .sha384, key: "key"))
        print("1234".hmacEncrypt(type: .sha512, key: "key"))
        
        let path = Bundle.main.path(forResource: "image", ofType: "jpg")
        print(path?.fileMD5Hash ?? "")
        print(path?.fileSHA1Hash ?? "")
        print(path?.fileSHA224Hash ?? "")
        print(path?.fileSHA256Hash ?? "")
        print(path?.fileSHA384Hash ?? "")
        print(path?.fileSHA512Hash ?? "")
        
        let message     = "123456"
        let key   = "key890123456dasdaeqweqweqweqwe"
        let ivString = "abcdefghijklmnop"   // 16 bytes for AES128
        let messageData = message.data(using:.utf8)!
        let keyData     = key.data(using: .utf8)!
        let ivData      = ivString.data(using: .utf8)!
        
        let encryptedData = messageData.aesEncrypt( keyData:keyData, ivData:ivData, operation:kCCEncrypt,keySize: kCCKeySizeAES256)
        let decryptedData = encryptedData.aesEncrypt( keyData:keyData, ivData:ivData, operation:kCCDecrypt,keySize: kCCKeySizeAES256)
        let decrypted     = String(bytes:decryptedData, encoding:String.Encoding.utf8)!
        print(encryptedData.base64EncodedString())
        print(decrypted)
        
        let encrypt = messageData.aesEncrypt(key: key, iv: ivString, operation: .encrypt,keySize: kCCKeySizeAES256)!
        let decrypt = encrypt.aesEncrypt(key: key, iv: ivString, operation: .decrypt,keySize: kCCKeySizeAES256)!
        let decryptStr = String(bytes:decrypt, encoding:String.Encoding.utf8)!
        print(encrypt.base64EncodedString())
        print(decryptStr)
        
    }
    @IBAction func clickButton(_ sender: Any) {
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        countButton.stopCountDown()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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


extension ViewController:AppKeyboardDelegate{
    func keyboardWillShow(keyboardHeight: CGFloat, animationTime: TimeInterval) {
        print(keyboardHeight,animationTime)
    }
    
    func keyboardWillHide(animationTime: TimeInterval) {
        print(animationTime)
    }
    
    
}
