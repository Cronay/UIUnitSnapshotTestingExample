//
//  SimpleViewControllerTests.swift
//  UIUnitTestingPresentationTests
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import XCTest
import UIUnitTestingPresentation

class SimpleViewControllerTests: XCTestCase {

    // sut = system under test
    
    func test_button_isConnected() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.button)
    }
    
    func test_textLabel_isConnected() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.textLabel)
    }
        
    private func makeSUT() -> SimpleViewController {
        let bundle = Bundle(for: SimpleViewController.self)
        let sb = UIStoryboard(name: "Simple", bundle: bundle)
        let sut: SimpleViewController = sb.instantiateViewController(identifier: String(describing: SimpleViewController.self))
        return sut
    }
}
