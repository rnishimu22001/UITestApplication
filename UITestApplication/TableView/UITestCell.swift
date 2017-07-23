//
//  UITestCell.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/16.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import UIKit

class UITestCell: UITableViewCell {
    
    @IBOutlet weak var testCellImage: UIImageView!
    @IBOutlet weak var testCellLabel: UILabel!
    
    var testLabel = ""
    var testImage = UIImage()
       
    func setUp(with image: UIImage, label: String) {
       
        self.testCellImage.image = image
        self.testCellLabel.text = label
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
    }
    
    class func height() -> CGFloat {
        return 112.0
    }
}
