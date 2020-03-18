//
//  DemoViewController.swift
//  SwiftAppUtils
//
//  Created by liquan on 2019/11/5.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

class DemoViewController: AppBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackBarItem(width: 200, image: UIImage.init(named: "icon")?.withRenderingMode(.alwaysOriginal), title: "标题", tintColor: .red)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
