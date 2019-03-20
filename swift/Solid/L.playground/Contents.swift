import UIKit

protocol CanFly {
    var flySpeed: Double { get set }
}

protocol CanSwim {
    var swimSpeed: Double { get set }
}

class Bird {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Eagle: Bird, CanFly {
    var flySpeed: Double
    
    init(name: String, flySpeed: Double) {
        self.flySpeed = flySpeed
        super.init(name: name)
    }
}

class Pinguin: Bird, CanSwim {
    
    var swimSpeed: Double
    
    init(name: String, swimSpeed: Double) {
        self.swimSpeed = swimSpeed
        super.init(name: name)
    }
}

let eagle = Eagle(name: "Eagle", flySpeed: 25)
let pinguin = Pinguin(name: "Pinguin", swimSpeed: 30)
