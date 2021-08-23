//
//  Addiction_TimerTests.swift
//  Addiction TimerTests
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import XCTest
@testable import Addiction_Timer

class AddHabitTests: XCTestCase {
    
    var sut: AddHabitController {
        let sut = AddHabitController()
        return sut
    }
    
    func testDelegatesDontRetain() {
        let controller = AddTitleViewController()
        assertNoMemoryLeak(controller)
        assertNoMemoryLeak(controller.view)
    }
    
}

extension XCTestCase {
    // Credit: https://www.essentialdeveloper.com/
    func assertNoMemoryLeak(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential retain cycle.", file: file, line: line)
        }
    }
}
