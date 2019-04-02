//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by ilya on 22.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewNotNilWhenViewisLoaded() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self))
        let sut = vc as! TaskListViewController
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }

}
