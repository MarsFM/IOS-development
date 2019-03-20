import UIKit


// Декоратор не изменяет свойтсва объекта

protocol CoffeType {
    func getPrice() -> Double
    func getName() -> String
}

final class Coffe: CoffeType {
    
    func getPrice() -> Double {
        return 30.0
    }
    
    func getName() -> String {
        return "Espresso"
    }
    
}

class CofeDecorator: CoffeType {
    
    var coffe: CoffeType
    
    init(coffe: CoffeType) {
        self.coffe = coffe
    }
    
    func getPrice() -> Double {
        return coffe.getPrice()
    }
    
    func getName() -> String {
        return coffe.getName()
    }
    
}

class Milk: CofeDecorator {
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getName() -> String {
        return super.getName() + ", with milk"
    }
    
}


class Chocolate: CofeDecorator {
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getName() -> String {
        return super.getName() + ", and with chocolate"
    }
    
}

let espresso = Coffe()
espresso.getName()
espresso.getPrice()

let espressoWithMilk = Milk(coffe: espresso)
espressoWithMilk.getName()
espressoWithMilk.getPrice()

let espessoWithMilkandChocolate = Chocolate(coffe: espressoWithMilk)
espessoWithMilkandChocolate.getName()
espessoWithMilkandChocolate.getPrice()
