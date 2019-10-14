//
//  CalcViewController.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/16.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import UIKit

final class CalcViewController: UIViewController {
    
    var session: URLSession?
    var task: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 画面が表示されたらリクエストをする
        let url = URL(string: "https://rnishimu22001testexample.co.jp?parameter=test")!
        self.session = URLSession(configuration: .default)
        let task = self.session?.dataTask(with: url) { [weak self] _,_,_ in
            self?.session?.invalidateAndCancel()
        }
        self.task = task
        task?.resume()
    }
}
