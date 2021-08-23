//
//  Addiction_TimerTests.swift
//  Addiction TimerTests
//
//  Created by Kenneth Dubroff on 8/22/21.
//

import XCTest
@testable import Addiction_Timer

class AddHabitTests: XCTestCase {
    
    var sut: (AddTitleViewController, AddHabitIntervalViewController, HabitInterval) {
        let addTitleController = AddTitleViewController()
        let intervalController = AddHabitIntervalViewController(controller: addTitleController.controller)
        let interval = HabitInterval(minutes: 60, dateStarted: Date())
        return (addTitleController, intervalController, interval)
    }
    
    func testDelegatesDontRetain() {
        let controller = AddTitleViewController()
        assertNoMemoryLeak(controller)
        assertNoMemoryLeak(controller.view)
    }
    
    func testHabitIsCreated() {
        let addTitleController = sut.0
        let addHabitIntervalController = sut.1
        
        addTitleController.updateTitle("Test")
        addHabitIntervalController.controller = addTitleController.controller
        addHabitIntervalController.updateInterval(sut.2)
        XCTAssertNotNil(addHabitIntervalController.controller.createHabit())
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
