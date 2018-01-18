//
//  KRRootViewController.swift
//  KRDrawLineView
//
//  Created by RK on 2017/12/31.
//  Copyright © 2017年 RK. All rights reserved.
//

import UIKit


class KRRootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    static let kKRTestViewCell = "UITableViewCell"

    var table:UITableView!
    let array:[String] = ["1", "2", "3"]
    
    //MARK:- lift
    override func viewDidLoad() {
        super.viewDidLoad();
        
        table = UITableView(frame:self.view.frame)
        
        table.delegate = self;
        table.dataSource = self;
        table.rowHeight = 40;
        
        self.view.addSubview(table);
        
        table.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:KRRootViewController.kKRTestViewCell);
    }
    
    //MARK:- tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            let vc =  KRCodeViewController();
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: KRRootViewController.kKRTestViewCell, for: indexPath);

        if (indexPath.row == 0) {
            cell.textLabel?.text = "代码中用 KRDrawLineView";
        }
        
        if (indexPath.row == 1) {
            cell.textLabel?.text = "xib中用 KRDrawLineView";
        }
        
        if (indexPath.row == 2) {
            cell.textLabel?.text = "添加分割线类Demo";
        }
        
        return cell;
    }
}
