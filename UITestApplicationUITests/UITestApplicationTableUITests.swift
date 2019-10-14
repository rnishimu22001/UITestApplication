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
        let firstIndex = 0
        let lastIndex = 5
        let rowCount = firstIndex...lastIndex
        
        rowCount.forEach {
            let cell = cells.element(boundBy: $0)
            let label = cell.staticTexts[$0.description]
            switch $0 {
            case firstIndex...4:
                // Found
                XCTAssertTrue(label.exists, "row number:" + $0.description)
            case lastIndex...lastIndex:
                // Cell not found
                XCTAssertFalse(label.exists, "row number:" + $0.description)
            default:
                XCTFail()
            }
        }
    }
}
