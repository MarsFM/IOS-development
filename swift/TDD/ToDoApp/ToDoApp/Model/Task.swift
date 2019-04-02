//
//  Task.swift
//  ToDoApp
//
//  Created by ilya on 21.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct Task {
    
    let title: String
    let description: String?
    private(set) var date: Date?
    let location: Location?
 
    init(title: String, description: String? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.location = location
        self.date = Date()
    }

}

extension Task: Equatable {
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        guard
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.location == rhs.location
        else { return false }
        
        return true
    }
}
