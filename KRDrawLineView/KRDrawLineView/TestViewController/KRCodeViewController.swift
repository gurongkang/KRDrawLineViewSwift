//
//  KRCodeViewController.swift
//  KRDrawLineView
//
//  Created by RK on 2018/1/17.
//  Copyright © 2018年 RK. All rights reserved.
//

import UIKit

class KRCodeViewController: UIViewController {

    let baseLabel = UILabel()
    let baseDrawLineView = KRDrawLineView()
    
    let dashLabel = UILabel()
    let dashDrawLineView = KRDrawLineView()
    
    let vLabel = UILabel()
    let vDrawLineView = KRDrawLineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        baseLabel.text = "1.基本使用"
        self.view.addSubview(baseLabel)
        
        dashLabel.text = "2.虚线使用"
        self.view.addSubview(dashLabel)
    
        baseDrawLineView.lineWidth = 1;
        baseDrawLineView.backgroundColor = UIColor.yellow;
       //默认线居中，开启在view的底部，一般用在花分割线，比如UITableView的cell中
        baseDrawLineView.isBottomLine = true;
        self.view.addSubview(baseDrawLineView)

        dashDrawLineView.lineWidth = 1;
        dashDrawLineView.lineStyle = KRDrawLineViewStyle.KRDrawLineViewStyleDashLine
        dashDrawLineView.lineColor = UIColor.red
        dashDrawLineView.paddingStart = 10
        dashDrawLineView.paddingEnd = 40;
        self.view.addSubview(dashDrawLineView)
        
        vLabel.text = "3.竖线使用"
        self.view.addSubview(vLabel)

        vDrawLineView.lineWidth = 1;
        vDrawLineView.backgroundColor = UIColor.yellow;
        self.view.addSubview(vDrawLineView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseLabel.frame = CGRect.init(x: 8, y: 64, width: self.view.frame.size.width, height: 40)
        baseDrawLineView.frame = CGRect.init(x: 0, y: 100, width: self.view.frame.size.width, height: 20)
        
        dashLabel.frame = CGRect.init(x: 8, y: 124, width: self.view.frame.size.width, height: 40)
        dashDrawLineView.frame = CGRect.init(x: 0, y: 164, width: self.view.frame.size.width, height: 20)

        vLabel.frame = CGRect.init(x: 8, y: 184, width: self.view.frame.size.width, height: 40)
        vDrawLineView.frame = CGRect.init(x: 60, y: 224, width: 20, height: 200)
    }

}
