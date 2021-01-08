//
//  UIUnitTestingPresentationUITests.swift
//  UIUnitTestingPresentationUITests
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import XCTest

class UIUnitTestingPresentationUITests: XCTestCase {
    
    func test_buttonPress_changesText() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons.firstMatch.tap()
        
        let receivedText = app.staticTexts["textLabel"].label
        
        XCTAssertEqual(receivedText, "Check24")
    }
    
}
