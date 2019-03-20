import UIKit

// Open Closed Principle - Принцип открытости/закрытости
// Суть заключается в том программные сущности должны быть открыты для расширения, но закрыты для изменения.

protocol CanwriteCode {
    func programming() -> String
}

class IosDeveloperCool: CanwriteCode {
    
    func programming() -> String {
        return "Swift"
    }
    
}

class IosDeveloper: CanwriteCode {
    
    func programming() -> String {
        return "Objective-c"
    }
}

class WebDeveloper: CanwriteCode {
    
    func programming() -> String {
        return "Ruby"
    }
    
}

//class Team { // Нарушает принцип, так как изменяет класс
//    let ios: [IosDeveloper]
//    let iosCool: [IosDeveloperCool]
//
//    init(ios: [IosDeveloper], iosCool: [IosDeveloperCool]) {
//        self.ios = ios
//        self.iosCool = iosCool
//    }
//
//    func programming() -> [String] {
//        return ios.map { $0.programming() } + iosCool.map { $0.programming() }
//    }
//
//}

class Team { // Открыт для расширения, закрыт для измененения
    
    let teams: [CanwriteCode]
    
    init(teams: [CanwriteCode]) {
        self.teams = teams
    }
    
    func programming() -> [String] {
        return teams.map { $0.programming() }
    }
    
}


let ios1 = IosDeveloper()
let ios2 = IosDeveloper()
let ios3 = IosDeveloperCool()
let ios4 = IosDeveloperCool()
let webDeveloper = WebDeveloper()

let coolTeam = Team(teams: [ios1, ios2, ios3, ios4, webDeveloper])
coolTeam.programming()
