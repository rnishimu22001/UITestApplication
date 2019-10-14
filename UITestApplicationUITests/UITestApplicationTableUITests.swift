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
        // app内に表示されている"TestCell"のアクセシビリティIDが振られた全てのセルを取得
        let cells = self.app.cells.matching(identifier: "TestCell")
        // app内のセルをカウント(まだ画面内にないものもカウントされる)
        XCTAssertEqual(cells.count, 1001)
    }
    
    func testTableViewCellExist() {
        
        let cells = self.app.cells.matching(identifier: "TestCell")
        // 1001番目を取得、0始まりなのに注意
        let cellAt1000 = cells.element(boundBy: 1000)
        let label = cellAt1000.staticTexts[1000.description].label
        // tableViewの1001番目のセルは存在しているのでTrue
        XCTAssertTrue(cellAt1000.exists)
        // 1001番目のセルは画面内にはいないのでHittableはfalse
        XCTAssertFalse(cellAt1000.isHittable)
        // 1001番目のセルであることの検査
        XCTAssertEqual(label, "1000")
    }
    
    func testTableViewCellSelect() {
        let cells = self.app.cells.matching(identifier: "TestCell")
        let cellAt1000 = cells.element(boundBy: 1000)
        // 抜き出したセルをタップ
        cellAt1000.tap()
        
    }
}
