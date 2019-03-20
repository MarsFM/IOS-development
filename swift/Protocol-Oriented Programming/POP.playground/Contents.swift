import UIKit

// Example 1

protocol Compared {
    associatedtype ValueType: Equatable
    var value: ValueType { get set }
    func isEqualTo(other: Self) -> Bool // Self это типа класса, в котором реализуется протокол
}

extension Compared {
    func isEqualTo(other: Self) -> Bool {
        return value == other.value
    }
}

struct Text: Compared {
    var value: String = ""
}

struct Number: Compared {
    var value: Int = 0
}

//class DocumentText: Text { // if text Class
//    var id: Int = 0
//
//    func isEqualTo(other: DocumentText) -> Bool {
//        return super.isEqualTo(other: other) && id == other.id
//    }
//}

extension Collection where Element: Compared {
    
    func findIndexOfElement(element: Element) -> Int? {
        var elementIndex: Int?
        
        for (index, item) in self.enumerated() {
            if item.isEqualTo(other: element) {
                elementIndex = index
                break
            }
        }
        
        return elementIndex
    }
    
}


var arr = [Number(value: 3), Number(value: 6)]
arr.findIndexOfElement(element: Number(value: 6))


// Example 2

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

extension Bird where Self: Flyable {
    var canFly: Bool {
        return true
    }
}

extension Flyable {
    func distance(time: Double) -> Double {
        return time * airspeedVelocity
    }
}

struct Pinguin: Bird {
    var name: String = "Pinguin"
    var canFly: Bool = false
}

enum Parrot: String, Bird, Flyable {
    case African
    case Mexican
    
    var name: String {
        return self.rawValue
    }
    
    var airspeedVelocity: Double {
        switch self {
        case .African:
            return 200
        case .Mexican:
            return 400
        }
    }
}

var parrot = Parrot.Mexican
parrot.canFly
parrot.name
parrot.distance(time: 3)
