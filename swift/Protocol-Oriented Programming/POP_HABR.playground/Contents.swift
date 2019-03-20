import UIKit

// Traits

protocol Protocol1 {}
protocol Protocol2 {}
protocol ComposedProtocol: Protocol1, Protocol2 { }

extension Protocol1 {
    func doWork() { print("Protocol1 method") }
}

extension Protocol2 {
    func doWork() { print("Protocol1 method") }
}

extension ComposedProtocol {
    func combinedWork() {
        (self as Protocol1).doWork()
        (self as Protocol2).doWork()
        print("ComposedProtocol method")
    }
}

class SomeClass: ComposedProtocol {}
let someClass = SomeClass()
someClass.combinedWork()

// Extensions

protocol Ordered {
    func precedes(other: Self) -> Bool
}

extension Ordered where Self: Comparable {
    func precedes(other: Self) -> Bool {
        return self < other
    }
}

extension Int: Ordered {}
extension String: Ordered {}

// Constraints

//func produce<F: Factory>(factory: F) where F.Product == Cola

protocol Order {
    associatedtype Identifier: Codable
}

protocol GenericProtocol1 {
    associatedtype Value: RawRepresentable where Value.RawValue == Int
    func getValue() -> Value
}

protocol GenericProtocol2 where Value.RawValue == Int {
    associatedtype Value: RawRepresentable
    func getValue() -> Value
}

protocol GenericProtocol3 where Value: RawRepresentable, Value.RawValue == Int {
    associatedtype Value
    func getValue() -> Value
}


protocol Animal {}
protocol Flying {}

extension Animal where Self: Flying {
    func fly() { }
}
