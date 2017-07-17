//
//  CalcView.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/16.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import UIKit

class CalcView: UIView {

    @IBOutlet weak var upperField: UITextField!
    @IBOutlet weak var lowerField: UITextField!
    @IBOutlet weak var formula: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var formulaSwitch: UISwitch!
    
    
    @IBAction func formulaChanged(_ sender: Any) {
        
        if self.formulaSwitch.isOn {
            self.formula.text = "+"
        } else {
            self.formula.text = "-"
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
        
        if self.formulaSwitch.isOn {
        
            result = upper + lower
        } else {
            result = upper - lower
        }
        
        self.resultLabel.text = result.description
        
        DispatchQueue.main.async {
            self.setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        self.formulaSwitch.accessibilityIdentifier = "FormulaChangeSwitch"
    }
}
