//
//  UITestApplicationUITests.swift
//  UITestApplicationUITests
//
//  Created by 西村龍亮 on 2017/07/17.
//  Copyright © 2017年 rnishimu. All rights reserved.
//

import XCTest
import Foundation
import OHHTTPStubs

final class UITestApplicationUITopMenuTests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
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
        
        let requestExpectation = self.expectation(description: "Calc View Request Expectation")
        // CalcViewが表示された際のリクエストをテストする
        stub(condition:{ _ in return false }) { request in
            guard let url = request.url,
                let component = URLComponents(url: url, resolvingAgainstBaseURL: false) else { XCTFail()
                    fatalError()
            }
            requestExpectation.fulfill()
            XCTAssertEqual(component.host, "rnishimu22001testexample.co.jp")
            let query = component.queryItems!.first!
            XCTAssertEqual(query.name, "parameter")
            XCTAssertEqual(query.value!, "test")
            
            let stubData = "Hello World!".data(using: .utf8)
            return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
        }
        calcButton.tap()
        // CalcViewが表示されたことをテストする
        let calcView = self.app.otherElements.matching(.any, identifier: "CalcView").firstMatch
        XCTAssertTrue(calcView.exists)
        XCTAssertTrue(calcView.isHittable)
        self.wait(for: [requestExpectation], timeout: 5.0)
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
