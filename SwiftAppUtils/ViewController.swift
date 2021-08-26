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
        PopDefaultConfig.shared.borderWidth = 1
        PopDefaultConfig.shared.borderColor = UIColor.blue
        PopDefaultConfig.shared.cornerRadius = 10
    }
    @IBAction func clickGlobalPopBtn(_ sender: Any) {
        let vc = GlobalPopVC.init(size: CGSize.init(width: 200, height: 200))
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func clickCustomPopBtn(_ sender: Any) {
        let vc = CustomPopVC.init(size: CGSize.init(width: 200, height: 200))
        present(vc, animated: true, completion: nil)
    }
}

