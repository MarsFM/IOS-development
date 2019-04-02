//
//  LocationTest.swift
//  ToDoAppTests
//
//  Created by ilya on 21.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import XCTest
import CoreLocation

@testable import ToDoApp

class LocationTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitSetName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func testInitSetCoordinates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1,
                                                longitude: 2)
        
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
         XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }


}
