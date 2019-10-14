//
//  UITestApplicationUITests.swift
//  UITestApplicationUITests
//
//  Created by 西村龍亮 on 2017/07/17.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import XCTest

class UITestApplicationUITopMenuTests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        self.app.launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMoveCalcButton() {
        let calcButton = self.app.buttons["MoveCalculater"]
        
        XCTAssertTrue(calcButton.exists)
        XCTAssertTrue(calcButton.isEnabled)
        // The calcButton is out of screen
        XCTAssertFalse(calcButton.isHittable)
        XCTAssertEqual(calcButton.label, "Calc")
    }
    
    func testMoveTableButton() {
        let tableButton = self.app.buttons["MoveTable"]
        
        XCTAssertTrue(tableButton.exists)
        XCTAssertTrue(tableButton.isEnabled)
        XCTAssertTrue(tableButton.isHittable)
        
        XCTAssertEqual(tableButton.label, "TableView")
        
        tableButton.tap()
    }
    
}
