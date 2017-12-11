//
//  ModalController.swift
//  Demo
//
//  Created by KDB on 2017/12/6.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit


class ModalController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        view.backgroundColor = UIColor.red
        
        self.view.addSubview(view)
        
    }

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}





