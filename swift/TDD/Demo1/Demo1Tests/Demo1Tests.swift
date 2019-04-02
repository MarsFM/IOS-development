//
//  Demo1Tests.swift
//  Demo1Tests
//
//  Created by ilya on 21.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
@testable import Demo1

class Demo1Tests: XCTestCase {

    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        sut = ViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testLowestVolumeShouldBeZero() {
        sut.setVolume(value: -100)
        
        let volume = sut.volume
        XCTAssert(volume == 0, "Lowers value should be equal 0")
    }
    
    func testHighestVolumeShouldBe100() {
        sut.setVolume(value: 200)
        
        let volume = sut.volume
        XCTAssert(volume == 100, "Highest value should be equal 100")
    }
    
    func testCharsInStringsAreThereSame() {
        // Given
        let string1 = "qwerty"
        let string2 = "ytrewq"
        // When
        let bool = sut.charactersCompare(stringOne: string1, stringTwo: string2)
        XCTAssert(bool, "Characters should be the same in two strings.")
        // Then
    }
    
    func testCharsInStringsAreDifferent() {
        // Given
        let string1 = "asdasd"
        let string2 = "ytrxzczxcewq"
        // When
        let bool = sut.charactersCompare(stringOne: string1, stringTwo: string2)
        XCTAssert(!bool, "Characters should be different in two strings.")
        // Then
    }

}
