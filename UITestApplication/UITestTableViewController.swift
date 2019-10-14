//
//  UITestTableViewController.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/16.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import UIKit

class UITestTableViewController: UITableViewController {
    
    struct CellIdentifier {
        static let test = "testCell"
    }
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let testCell = UINib(nibName: "UITestCell", bundle: nil)
        
        self.tableView.register(testCell, forCellReuseIdentifier: CellIdentifier.test)
    }
}

extension UITestTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
}

extension UITestTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: CellIdentifier.test) as? UITestCell else {
            return UITableViewCell()
        }
        cell.setUp(with: UIImage(), label: indexPath.row.description)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITestCell.height()
    }
    
}
