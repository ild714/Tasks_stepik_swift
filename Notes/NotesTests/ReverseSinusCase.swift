//
//  ReverseSinusCase.swift
//  NotesTests
//
//  Created by Ильдар Нигметзянов on 03/08/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import XCTest
@testable import Notes

class ReverseSinusCase: XCTestCase {

    func testReverseSinus() {
        let value = try! 1.0.reverseSinus()
        XCTAssertEqual(0.8414709848078965,value)
        
    }
   
    func testReverseSinus1() {
        XCTAssertThrowsError(try 0.0.reverseSinus())
        
    }
}
