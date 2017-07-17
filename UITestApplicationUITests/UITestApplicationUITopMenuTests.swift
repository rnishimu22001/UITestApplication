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
    
    func testElement() {
        let calcButton = self.app.buttons["MoveCalculater"]
        
        XCTAssertTrue(calcButton.exists)
    }
    
}
