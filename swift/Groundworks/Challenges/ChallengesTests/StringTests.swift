//
//  ChallengesTests.swift
//  ChallengesTests
//
//  Created by ilya on 21.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
@testable import Challenges

class StringTests: XCTestCase {

    var tasksOnString: TasksOnString!
    
    override func setUp() {
        super.setUp()
        
        tasksOnString = TasksOnString()
        tasksOnString.challenge14(string: "abc")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testChallenge1aAnd1b() {
        XCTAssert(tasksOnString.challenge1a(input: "No duplicates") == true)
        XCTAssert(tasksOnString.challenge1a(input: "abcdefghijklmnopqrstuvwxyz") == true)
        XCTAssert(tasksOnString.challenge1a(input: "AaBbCc") == true)
        XCTAssert(tasksOnString.challenge1a(input: "Hello, world") == false)
        
        XCTAssert(tasksOnString.challenge1b(input: "No duplicates") == true)
        XCTAssert(tasksOnString.challenge1b(input: "abcdefghijklmnopqrstuvwxyz") == true)
        XCTAssert(tasksOnString.challenge1b(input: "AaBbCc") == true)
        XCTAssert(tasksOnString.challenge1b(input: "Hello, world") == false)
    }
    
    func testChallenge2aAnd2B() {
        XCTAssert(tasksOnString.challenge2a(input: "rottor") == true)
        XCTAssert(tasksOnString.challenge2a(input: "Rats live on no evil star") == true)
        XCTAssert(tasksOnString.challenge2a(input: "Never odd or even") == false)
        XCTAssert(tasksOnString.challenge2a(input: "Hello, world") == false)
        
        XCTAssert(tasksOnString.challenge2b(input: "rottor") == true)
        XCTAssert(tasksOnString.challenge2b(input: "Rats live on no evil star") == true)
        XCTAssert(tasksOnString.challenge2b(input: "Never odd or even") == false)
        XCTAssert(tasksOnString.challenge2b(input: "Hello, world") == false)
    }
    
    func testChallenge3() {
        XCTAssert(tasksOnString.challenge3(string1: "abca", string2: "abca") == true)
        XCTAssert(tasksOnString.challenge3(string1: "abc", string2: "cba") == true)
        XCTAssert(tasksOnString.challenge3(string1: "a1b2", string2: "b1a2") == true)
        XCTAssert(tasksOnString.challenge3(string1: "abc", string2: "abca") == false)
        XCTAssert(tasksOnString.challenge3(string1: "abc", string2: "Abc") == false)
        XCTAssert(tasksOnString.challenge3(string1: "abc", string2: "cbAa") == false)
    }
    
    func testChallenge4AndB() {
        XCTAssert("Hello, world".fuzzyContains(input: "Hello") == true)
        XCTAssert("Hello, world".fuzzyContains(input: "WORLD") == true)
        XCTAssert("Hello, world".fuzzyContains(input: "Goodbye") == false)
        
        XCTAssert("Hello, world".fuzzyContainsB(input: "Hello") == true)
        XCTAssert("Hello, world".fuzzyContainsB(input: "WORLD") == true)
        XCTAssert("Hello, world".fuzzyContainsB(input: "Goodbye") == false)
    }
    
    func testChallenge5aAnd5B() {
        XCTAssert(tasksOnString.challenge5a(input: "The rain in Spain", count: "a") == 2)
        XCTAssert(tasksOnString.challenge5a(input: "Mississippi", count: "i") == 4)
        XCTAssert(tasksOnString.challenge5a(input: "Hacking with Swift", count: "i") == 3)
        
        XCTAssert(tasksOnString.challenge5b(input: "The rain in Spain", count: "a") == 2)
        XCTAssert(tasksOnString.challenge5b(input: "Mississippi", count: "i") == 4)
        XCTAssert(tasksOnString.challenge5b(input: "Hacking with Swift", count: "i") == 3)
        
        XCTAssert(tasksOnString.challenge5c(input: "The rain in Spain", count: "a") == 2)
        XCTAssert(tasksOnString.challenge5c(input: "Mississippi", count: "i") == 4)
        XCTAssert(tasksOnString.challenge5c(input: "Hacking with Swift", count: "i") == 3)
    }
    
    func testChallenge6() {
        XCTAssert(tasksOnString.challenge6a(input: "wombat") == "wombat")
        XCTAssert(tasksOnString.challenge6a(input: "hello") == "helo")
        XCTAssert(tasksOnString.challenge6a(input: "Mississippi") == "Misp")
        
        XCTAssert(tasksOnString.challenge6b(input: "wombat") == "wombat")
        XCTAssert(tasksOnString.challenge6b(input: "hello") == "helo")
        XCTAssert(tasksOnString.challenge6b(input: "Mississippi") == "Misp")
    }
    
    func testChallenge7() {
        XCTAssert(tasksOnString.challenge7(input: "a   b   c") == "a b c")
        XCTAssert(tasksOnString.challenge7(input: "   a") == " a")
        XCTAssert(tasksOnString.challenge7(input: "abc") == "abc") 
    }
    
    func testChallenge8() {
        XCTAssert(tasksOnString.challenge8(string1: "abcde", string2: "eabcd") == true)
        XCTAssert(tasksOnString.challenge8(string1: "abcde", string2: "cdeab") == true)
        XCTAssert(tasksOnString.challenge8(string1: "abcde", string2: "abced") == false)
        XCTAssert(tasksOnString.challenge8(string1: "abc", string2: "a") == false)
        
        XCTAssert(tasksOnString.challenge8b(string1: "abcde", string2: "eabcd") == true)
        XCTAssert(tasksOnString.challenge8b(string1: "abcde", string2: "cdeab") == true)
        XCTAssert(tasksOnString.challenge8b(string1: "abcde", string2: "abced") == false)
        XCTAssert(tasksOnString.challenge8b(string1: "abc", string2: "a") == false)
    }
    
    func testChallenge9() {
        XCTAssert(tasksOnString.challenge9(input: "The quick brown fox jumps over the lazy dog") == true)
        XCTAssert(tasksOnString.challenge9(input: "The quick brown fox jumped over the lazy dog") == false)
    }
    
    func testChallenge10() {
        XCTAssert(tasksOnString.challenge10(input: "Swift Coding Challenges") == (6,15))
        XCTAssert(tasksOnString.challenge10(input: "Mississippi") == (4,7))
    }

    func testChallenge11() {
        XCTAssert(tasksOnString.challenge11(firstStr: "Clamp", secondStr: "Cramp") == true)
        XCTAssert(tasksOnString.challenge11(firstStr: "Clamp", secondStr: "Crams") == true)
        XCTAssert(tasksOnString.challenge11(firstStr: "Clamp", secondStr: "Grams") == true)
        XCTAssert(tasksOnString.challenge11(firstStr: "Clamp", secondStr: "Grans") == false)
        XCTAssert(tasksOnString.challenge11(firstStr: "Clamp", secondStr: "Clam") == false)
        XCTAssert(tasksOnString.challenge11(firstStr: "Clamp", secondStr: "maple") == false)
    }
    
    func testChallenge12() {
        XCTAssert(tasksOnString.challenge12(input: "swift switch swill swim") == "swi")
        XCTAssert(tasksOnString.challenge12(input: "flip flap flop") == "fl")
    }
    
    func testChallenge13() {
        XCTAssert(tasksOnString.challenge13(input: "aabbcc") == "a2b2c2")
        XCTAssert(tasksOnString.challenge13(input: "aaabaaabaaa") == "a3b1a3b1a3")
        XCTAssert(tasksOnString.challenge13(input: "aaAAaa") == "a2A2a2")
    }
    
    func testChallenge15() {
        XCTAssert(tasksOnString.challenge15(input: "Swift Coding Challenges") == "tfiwS gnidoC segnellahC")
    }
    
}
