import UIKit

// Single responsibility principle - Принцип единственной обязанности
// На каждый класс должны быть наложена одна единственная обязаность

protocol CanBeOn {
    func on()
}

protocol CanBeOff {
    func off()
}

class Switch: CanBeOn, CanBeOff {
    
    fileprivate var stateOn = false
    
    func on() {
        stateOn = true
    }
    
    func off() {
        stateOn = false
    }
    
}

class SwitchOn {
    let switcher: CanBeOn
    
    init(switcher: CanBeOn) {
        self.switcher = switcher
    }
    
    func execute() {
        switcher.on()
    }
}

class SwitchOff {
    let switcher: CanBeOff
    
    init(switcher: CanBeOff) {
        self.switcher = switcher
    }
    
    func execute() {
        switcher.off()
    }
}

let switcher = Switch()
switcher.stateOn

let switcherOn = SwitchOn(switcher: switcher)
switcherOn.execute()
switcher.stateOn

let switcherOff = SwitchOff(switcher: switcher)
switcherOff.execute()
switcher.stateOn
