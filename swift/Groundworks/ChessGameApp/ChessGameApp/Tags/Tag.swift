//
//  Tags.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct Tag {
    
    var name: String
    var color: String
    
}

struct Tags {
    
    var tags: [Tag] = []
    
    mutating func add(tag: Tag) {
        tags.append(tag)
    }
    
    mutating func remove(at index: Int) -> Tag {
        let tag = tags.remove(at: index)
        return tag
    }
    
    mutating func removeLast() -> Tag {
        return tags.removeLast()
    }
    
    func showAllTags() -> [Tag] {
        return tags
    }
    
}
