//
//  CustomSBPopVC.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2021/8/26.
//

import UIKit

class CustomSBPopVC: DefaultPopVC {
    
    override func viewDidLoad() {
        size = CGSize.init(width: UIScreen.main.bounds.size.width, height: 300)
        super.viewDidLoad()
    }
    
}

extension CustomSBPopVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
