//
//  ViewController.swift
//  AMToast
//
//  Created by sxf on 05/30/2025.
//  Copyright (c) 2025 sxf. All rights reserved.
//

import UIKit
import AMToast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func centerToastTaped(_ sender: Any) {
        AMToast.showSuccess(with: "已成功领取")
    }
    
    @IBAction func topToastTaped(_ sender: Any) {
        AMToast.showSuccess(with: "失败", duration: 2, position: .top)
    }
}

