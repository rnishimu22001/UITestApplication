//
//  CalcView.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/16.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import UIKit

enum Formula: Int {
    case plus = 0
    case minus = 1
}

class CalcView: UIView {

    @IBOutlet weak var upperField: UITextField!
    @IBOutlet weak var lowerField: UITextField!
    @IBOutlet weak var formula: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var formulaSwitch: UISegmentedControl!
    
    
    @IBAction func formulaChanged(_ sender: Any) {
        
        switch Formula(rawValue: self.formulaSwitch.selectedSegmentIndex) {
        case .plus?:
            self.formula.text = "+"
        case .minus?:
            self.formula.text = "-"
        default:
            return
        }
        
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
        
    }
    
    @IBAction func performCalc(_ sender: Any) {
        
        guard let upperText = upperField.text,
            let lowerText = lowerField.text,
            let upper = Int(upperText),
            let lower = Int(lowerText) else {
            return
        }
        
        var result = 0
        
        switch Formula(rawValue: self.formulaSwitch.selectedSegmentIndex) {
        case .plus?:
            result = upper + lower
        case .minus?:
            result = upper - lower
        default:
            return
        }
        
        self.resultLabel.text = result.description
        
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
    }
}
