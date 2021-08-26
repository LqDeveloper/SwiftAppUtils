//
//  CustomSBPopVC.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2021/8/26.
//

import UIKit

class CustomSBPopVC: DefaultPopoVC {
    
    override func viewDidLoad() {
        size = CGSize.init(width: 200, height: 300)
        observerKeyboard = true
        super.viewDidLoad()
    }
    
}

extension CustomSBPopVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
