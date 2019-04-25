//
//  Parrernmathing.swift
//  Challenges
//
//  Created by ilya on 22.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class PatternMathing {
    
    // 1 SWITCH
    func simpleSwitch() {
        let authentication = (name: "twostraws", password: "fr0st1es")
        
        switch authentication {
        case ("bilbo", "bagg1n5"):
            print("Hello, Bilbo Baggins!")
        case ("twostraws", "fr0st1es"):
            print("Hello, Paul Hudson!")
        default:
            print("Who are you?")
        }
    }
    
    func partialMatches() {
        let authentication = (name: "twostraws", password: "fr0st1es", ipAddress: "127.0.0.1")
        switch authentication {
        case ("twostraws", "bagg1n5", _): print("Hello, Bilbo Baggins!")
        case let ("twostraws", password, _): print("Hello, Paul Hudson: your password was \(password)!")
        default: print("Who are you?")
        }
    }
    
    // 2 FOR
    func simpleFor() {
        let twostraws = (name: "twostraws", password: "fr0st1es")
        let bilbo = (name: "bilbo", password: "bagg1n5")
        let taylor = (name: "taylor", password: "fr0st1es")
        
        let users = [twostraws, bilbo, taylor]
        
        for user in users {
            print(user.name)
        }
        
        for case ("twostraws", "fr0st1es") in users {
            print("User twostraws has the password fr0st1es")
        }
        
        for case let (name, password) in users {
            print("User \(name) has the password \(password)")
        }
    }
    
    // 3 Matching optionals
    
    func matchingOptionals() {
        let name: String? = "twostraws"
        let password: String? = "fr0st1es"
        
        switch (name, password) {
        case let (name?, password?): print("Hello, \(name) \(password)")
        case let (name?, nil): print("Please enter a \(name)")
        default: print("Who are you?")
        }
        
        let data: [Any?] = ["Bill", nil, 69, "Ted"]
        
        for case let datum? in data {
            print(datum)
        }
    }
    
    // 4 Matching ranges
    
    func matchingRanges() {
        let age = 36
        
        switch age {
        case 0 ..< 18:
            print("You have the energy and time, but not the money")
        case 18 ..< 70:
            print("You have the energy and money, but not the time")
        default:
            print("You have the time and money, but not the energy")
        }
        
        if case 0 ..< 18 = age {
            print("You have the energy and time, but not the money")
        } else if case 18 ..< 70 = age {
            print("You have the energy")
        }
        
        if  0 ..< 18 ~= age {
            print("You have the energy and time, but not the money")
        } else if 18 ..< 70 ~= age {
            print("You have the energy")
        }
        
        let user = (name: "twostraws", password: "fr0st1es", age: 36)
        
        switch user {
        case let (name, _, 0 ..< 18):
            print("\(name) has the energy and time, but no money")
        case let (name, _, 18 ..< 70):
            print("\(name) has the money and energy, but no time")
        case let (name, _, _):
            print("\(name) has the time and money, but no energy")
        }
    }
    
    // 5. Matching enums and associated values
    enum WeatherType {
        case cloudy(coverage: Int)
        case sunny
        case windy
    }
    
    func enumMatching() {
        let today: WeatherType = .cloudy(coverage: 100)
        
        switch today {
        case .cloudy(let coverage) where coverage < 100: print("It is cloudy with \(coverage)% coverage")
        case .cloudy(let coverage) where coverage == 100: print("You must live in the UK")
        case .windy: print("Sunny")
        default: print("windy")
        }
        
        let forecast: [WeatherType] = [.cloudy(coverage: 40),
                                       .sunny, .windy, .cloudy(coverage: 100), .sunny]
        
        for case let .cloudy(coverage) in forecast {
            print("It's cloudy with \(coverage)% coverage")
        }
    }
    
    // 6. Using the where keyword
    func whereTest() {
        let celebrities = ["Michael Jackson","Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]
        
        for name in celebrities where !name.hasPrefix("Michael") {
            print(name)
        }
    }
    
    // 7. Nil coalescing
    
    
}
