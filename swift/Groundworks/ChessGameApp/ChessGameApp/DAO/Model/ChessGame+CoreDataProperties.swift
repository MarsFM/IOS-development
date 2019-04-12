//
//  ChessGame+CoreDataProperties.swift
//  ChessGameApp
//
//  Created by ilya on 11.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//
//

import Foundation
import CoreData


extension ChessGame {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChessGame> {
        return NSFetchRequest<ChessGame>(entityName: "ChessGame")
    }

    @NSManaged public var color: String?
    @NSManaged public var desc: String?
    @NSManaged public var name: String?
    @NSManaged public var notation: String?

}
