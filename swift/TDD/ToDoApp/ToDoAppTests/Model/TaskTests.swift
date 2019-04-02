//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by ilya on 21.03.2019.
//  Copyright © 2019 ilya. All rights reserved.


import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertTrue(task.description == "Bar")
    }
    
    func testTaskInitsWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar", description: "Baz", location: location)
        XCTAssertEqual(location, task.location)
    }
    
}
