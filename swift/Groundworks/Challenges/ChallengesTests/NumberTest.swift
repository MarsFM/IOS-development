//
//  NumberTest.swift
//  ChallengesTests
//
//  Created by ilya on 24.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
@testable import Challenges

var task: TasksOfNumber!

class NumberTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        task = TasksOfNumber()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testChallenges1() {
        XCTAssert(task.challenge1(number: 15) == "Fizz Buzz")
        XCTAssert(task.challenge1(number: 5) == "Buzz")
        XCTAssert(task.challenge1(number: 3) == "Fizz")
        XCTAssert(task.challenge1(number: 12) == "Fizz")
        XCTAssert(task.challenge1(number: 20) == "Buzz")
        XCTAssert(task.challenge1(number: 98) == "98")
        XCTAssert(task.challenge1(number: 1) == "1")
        XCTAssert(task.challenge1(number: 4) == "4")
    }
    
    func testChallenges2() {
        XCTAssert(task.challenge2(minNumber: 1, maxNumber: 1) == 1)
    }
    
    func testChallenge3() {
        XCTAssert(task.challenge3(number: 2, power: 4) == 16)
        XCTAssert(task.challenge3(number: 3, power: 2) == 9)
    }
    
    func testChallenge4() {
        var a1 = 4
        var b1 = 2
        var a2 = 2
        var b2 = 10
        XCTAssert(task.challenge4(n1: &a1, n2: &b1) == (2,4))
        XCTAssert(task.challenge4(n1: &a2, n2: &b2) == (10,2))
    }
    
    func testChallenge5() {
        XCTAssert(task.challenge5(n: 13) == true)
        XCTAssert(task.challenge5(n: 11) == true)
        XCTAssert(task.challenge5(n: 4) == false)
        XCTAssert(task.challenge5(n: 9) == false)
        XCTAssert(task.challenge5(n: 16777259) == true)
        XCTAssert(task.challenge5(n: 100) == false)
    }
    
    func testChallenge6() {
        XCTAssert(task.challenge6(n: 12) == (10, 17))
        XCTAssert(task.challenge6(n: 28) == (26, 35))
    }
    
    func testChallenge7() {
        XCTAssert(task.challenge7(n: 32) == 4)
        XCTAssert(task.challenge7(n: 41) == 148)
    }
    
    func testChallenge8() {
        XCTAssert(task.challenge8(n: "01010101") == true)
        XCTAssert(task.challenge8(n: "123456789") == true)
        XCTAssert(task.challenge8(n: "9223372036854775808") == true)
        XCTAssert(task.challenge8(n: "1.0") == false)
    }
    
    func testChallenge9() {
        XCTAssert(task.challenge9a(input: "a1b2c3") == 6)
        XCTAssert(task.challenge9a(input: "a10b20c30") == 60)
        XCTAssert(task.challenge9a(input: "h8ers") == 8)
    }
    
    func testChallenge10() {
        XCTAssert(task.challenge10(number: 9) == 3)
        XCTAssert(task.challenge10(number: 16777216) == 4096)
        XCTAssert(task.challenge10(number: 16) == 4)
        XCTAssert(task.challenge10(number: 15) == 3)
    }
    
}
