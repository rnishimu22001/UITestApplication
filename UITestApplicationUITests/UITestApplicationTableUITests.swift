//
//  UITestApplicationTableUITests.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/17.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import XCTest

class UITestApplicationTableUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        self.app.launch()
        self.app.buttons["MoveTable"].tap()
    }
    
    func testTableViewCellExist() {
        
        let cells = self.app.cells.matching(identifier: "TestCell")
        let rowCount = 6
        
        for i in 0..<rowCount {
            let cell = cells.element(boundBy: i)
            let label = cell.staticTexts[i.description]
            // test will be failed
            XCTAssertTrue(label.exists, "row number:" + i.description)
        }
        
    }
}
