//
//  LQViewController.swift
//  SwiftAppUtils
//
//  Created by Quan Li on 2019/10/24.
//  Copyright © 2019 Quan Li. All rights reserved.
//

import UIKit

class LQViewController: UIViewController {
    lazy var router = AppRouter.init(viewController: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickBack(_ sender: Any) {
        router.backToVC()
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
