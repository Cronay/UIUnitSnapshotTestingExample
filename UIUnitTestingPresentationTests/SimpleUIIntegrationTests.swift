//
//  SimpleViewControllerTests.swift
//  UIUnitTestingPresentationTests
//
//  Created by Yannic Borgfeld on 08.01.21.
//

import XCTest
import UIUnitTestingPresentation

class SimpleUIIntegrationTests: XCTestCase {

    // sut = system under test
    
    func test_button_isConnected() {
        let (sut, _) = makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.button)
    }
    
    func test_textLabel_isConnected() {
        let (sut, _) = makeSUT()
        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.textLabel)
    }
    
    func test_buttonTap_changesTextOnLabel() {
        let receivedText = "Check24 Profis"
        let (sut, loader) = makeSUT()
        sut.loadViewIfNeeded()
        
        sut.button?.simulateTap()
        XCTAssertNil(sut.textLabel?.text)
        
        loader.complete(with: receivedText, at: 0)
        
        XCTAssertEqual(sut.textLabel?.text, receivedText)
    }
        
    private func makeSUT() -> (sut: SimpleViewController, loader: LoaderSpy) {
        let loader = LoaderSpy()
        let sut = SimpleUIComposer.compose(with: loader)
        return (sut, loader)
    }
    
    private class LoaderSpy: TextLoader {
        var completions = [(String) -> Void]()
        
        func load(completion: @escaping (String) -> Void) {
            completions.append(completion)
        }
        
        func complete(with text: String, at index: Int) {
            completions[index](text)
        }
    }
}

extension UIButton {
    func simulateTap() {
        self.sendActions(for: .touchUpInside)
    }
}
