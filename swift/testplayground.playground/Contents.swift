import UIKit

struct Starship {
    var name: String
    var maxWarp: Double
}

let voyager = Starship(name: "Voyager", maxWarp: 9.975)

let nameKeyPath = \Starship.name
let warpKeyPath = \Starship.maxWarp

print(voyager[keyPath: nameKeyPath])
print(voyager[keyPath: warpKeyPath])
