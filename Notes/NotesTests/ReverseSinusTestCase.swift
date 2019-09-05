//
//  ReverseSinusTestCase.swift
//  NotesTests
//
//  Created by Ильдар Нигметзянов on 07/07/2019.
//  Copyright © 2019 Ильдар Нигметзянов. All rights reserved.
//


import XCTest

class ReverseSinusTestCase: XCTestCase {

    func testReverseSinus() {
        let value = try! 1.0.reverseSinus()
        XCTAssertEqual(0.8414709848078965, value)
    }

    /*
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
*/
}

import UIKit

enum MyError: Error {
    
    case RuntimeError(message: String)
    
}

extension Double {
    
    func reverseSinus() throws -> Double {
        if (abs(self) < Double.ulpOfOne) {
            throw MyError.RuntimeError(message: "Could not evaluate reverse for zero value")
        }
        
        return sin(1 / self)
    }
    
}

