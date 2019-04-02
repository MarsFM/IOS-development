//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by ilya on 22.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {
    var sut: TaskManager!
    
    override func setUp() {
        sut = TaskManager()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testInitTaskManagerWithZeroTask() {
        XCTAssertEqual(sut.taskCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTask() {
        XCTAssertEqual(sut.doneTaskCount, 0)
    }
    
    func testAddTaskIncrementTaskCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        XCTAssertEqual(sut.taskCount, 1)
    }
    
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }
    
    func testCheckTaskAtIndexCahngesCounts() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        XCTAssertEqual(sut.taskCount, 0)
        XCTAssertEqual(sut.doneTaskCount, 1)
    }
    
    func testCheckTaskRemoveFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondtask = Task(title: "Bar")
        
        sut.add(task: firstTask)
        sut.add(task: secondtask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), secondtask)
    }
    
    func testDoneTaskAtReturnsCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        XCTAssertEqual(returnedTask, task)
    }
    
    func testRemoveAllResultsCountsBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))
        sut.checkTask(at: 0)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.taskCount == 0)
        XCTAssertTrue(sut.doneTaskCount == 0)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))
        
        XCTAssertTrue(sut.taskCount == 1)
    }

}
