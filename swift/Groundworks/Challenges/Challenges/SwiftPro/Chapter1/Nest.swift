//
//  Singer.swift
//  Challenges
//
//  Created by ilya on 22.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

enum London {
    
    static let coordinates = (lat: 51.507222, long: -0.1275)
    
    enum SubwayLines {
        case bakerloo, central, circle, district, elizabeth, hammersmithCity, jubilee, metropolitan, northern, piccadilly, victoria, waterlooCity
    }
    
    enum Places {
        case buckinghamPalace, cityHall, oldBailey, piccadilly, stPaulsCathedral
    }
}

struct Deck {
    struct Card {
        private enum Suit {
            case hearts, diamonds, clubs, spades
        }
        
        var rank: Int
        private var suit: Suit
    }
    var cards = [Card]()
}


struct Point {
    let x: Double
    let y: Double
}

enum DistanceTechnique {
    case euclidean
    case euclideanSquared
    case manhattan
}

func calculateEuclideanDistanceSquared(start: Point, end: Point) -> Double {
    let deltaX = start.x - end.x
    let deltaY = start.y - end.y
    
    return deltaX * deltaX + deltaY * deltaY
}

func calculateEuclideanDistance(start: Point, end: Point) -> Double {
    return sqrt(calculateEuclideanDistanceSquared(start: start, end: end))
}

func calculateManhattanDistance(start: Point, end: Point) -> Double {
    return abs(start.x - end.x) + abs(start.y - end.y)
}
