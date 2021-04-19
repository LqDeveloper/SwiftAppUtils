//
//  ViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2021/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a:Int? = nil
        print(a.isNone)
        a.onNone {
            print("a 为nil")
        }
        print(a.or(10))
    }


}

