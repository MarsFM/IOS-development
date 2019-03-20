import UIKit

// Нижний уровень зависит от абстракции
// Верхний уровень не должне зависеть от нижнего уровня

protocol GetFood {
    func getFood() -> String
}

class UnhallyMan { // Жёстко зависит от первый жены
    let wife = FirstWife()
    var food: String {
        return wife.getFood()
    }
}

class FirstWife: GetFood {
    
    func getFood() -> String {
        return "Vegeterian food"
    }
    
}

class NormalMan {
    var foodProveder: GetFood
    var food: String {
        return foodProveder.getFood()
    }
    
    init(foodProveder: GetFood) {
        self.foodProveder = foodProveder
    }
}

class SecondWife: GetFood {
    func getFood() -> String {
        return "Fast food"
    }
}

let firstWife = FirstWife()
let secondWife = SecondWife()
let normalMan = NormalMan(foodProveder: secondWife)
normalMan.food

normalMan.foodProveder = firstWife
normalMan.food
