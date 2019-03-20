//
//  Message.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct Message {
    
    var id: String
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
    
    init(text: String) {
        self.init()
        self.text = text
    }
    
}
