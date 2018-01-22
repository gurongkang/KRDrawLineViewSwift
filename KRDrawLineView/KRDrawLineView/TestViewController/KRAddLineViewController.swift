//
//  KRAddLineViewController.swift
//  KRDrawLineView
//
//  Created by RK on 2018/1/22.
//  Copyright © 2018年 RK. All rights reserved.
//

import UIKit

class KRAddLineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        
        let testView = UIView.init(frame: CGRect.init(x: 50.0, y: 100.0, width: 200.0, height: 200.0))
        testView.backgroundColor = UIColor.white
        self.view.addSubview(testView)
        
        UIView.addTopLineToView(view: testView, offsetLeft: 10.0, offsetRight: 8.0, color: UIColor.red)
        
        UIView.addRightLineToView(view: testView, offsetTop: 10.0, offsetBottom: 0.0, color: UIColor.red)
    }

}
