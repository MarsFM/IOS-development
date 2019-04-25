//
//  FilesTests.swift
//  ChallengesTests
//
//  Created by ilya on 23.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
@testable import Challenges

class FilesTests: XCTestCase {

    var task: TaskOnFiles!
    
    override func setUp() {
        super.setUp()
        
        task = TaskOnFiles()
        _ = task.challenge5()
        _ = task.challenge6(count: "Hello")
        task.challenge7()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testChallenge1() {
        XCTAssert(task.challenge1(filename: "challenge1", lineCount: 3) == "Twelfth Night, Othello, Macbeth")
        XCTAssert(task.challenge1(filename: "challenge1", lineCount: 100) == "Twelfth Night, Othello, Macbeth, King Lear, Julius Caesar, Hamlet, Cymbeline, Coriolanus, Antony And Cleopatra")
        XCTAssert(task.challenge1(filename: "challenge1", lineCount: 0) == "")
    }
    
    func testChallenge2() {
        
    }

}
