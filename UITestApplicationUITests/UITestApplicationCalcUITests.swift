//
//  UITestApplicationUICalcTests.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/17.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import XCTest

class UITestApplicationUICalcTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        self.app.launch()
        self.app.buttons["MoveCalculater"].tap()
        
    }
    
    func testFirstView() {
        let formulaSwitch = self.app.switches["FormulaChangeSwitch"]
        let upper = self.app.textFields["UpperField"]
        let lower = self.app.textFields["LowerField"]
        let formulaLabel = self.app.staticTexts["CalculateFomula"]
        
        XCTAssertTrue(formulaSwitch.exists)
        XCTAssertTrue(upper.isEnabled)
        XCTAssertTrue(lower.isEnabled)
        XCTAssertEqual(formulaLabel.label, "+")
        
        
    }
    
    func testChangeSwitch() {
        let formulaSwitch = self.app.switches["FormulaChangeSwitch"]
        let upper = self.app.textFields["UpperField"]
        let lower = self.app.textFields["LowerField"]
        let formulaLabel = self.app.staticTexts["CalculateFomula"]
        formulaSwitch.tap()
        XCTAssertTrue(upper.isEnabled)
        XCTAssertTrue(lower.isEnabled)
        XCTAssertEqual(formulaLabel.label, "-")
    }
    
}
