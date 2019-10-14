//
//  UITestApplicationTableUITests.swift
//  UITestApplication
//
//  Created by 西村龍亮 on 2017/07/17.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import Foundation
import XCTest

final class UITestApplicationTableUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        self.app.launch()
        self.app.buttons["MoveTable"].tap()
    }
    
    func testTableViewCellNumber() {
        let cells = self.app.cells.matching(identifier: "TestCell")
        XCTAssertEqual(cells.count, 1001)
    }
    
    func testTableViewCellExist() {
        
        let cells = self.app.cells.matching(identifier: "TestCell")
        let cellAt1000 = cells.element(boundBy: 1000)
        let label = cellAt1000.staticTexts[1000.description].label
        XCTAssertTrue(cellAt1000.exists)
        XCTAssertFalse(cellAt1000.isHittable)
        XCTAssertEqual(label, "1000")
    }
    
    func testTableViewCellSelect() {
        let cells = self.app.cells.matching(identifier: "TestCell")
        let cellAt1000 = cells.element(boundBy: 1000)
        cellAt1000.tap()
    }
}
