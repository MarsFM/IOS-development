//
//  Location.swift
//  ToDoApp
//
//  Created by ilya on 21.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
    
}

extension Location: Equatable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard lhs.coordinate?.latitude == rhs.coordinate?.latitude &&
        lhs.coordinate?.longitude ==  rhs.coordinate?.longitude &&
            rhs.name == lhs.name else { return false }
        
        return true
    }
    
}
