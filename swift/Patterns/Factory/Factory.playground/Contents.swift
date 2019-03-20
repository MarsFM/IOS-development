import Foundation

// Реальный пример 1
print("---------FIRST EXAMPLE-------------")

protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro : Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar : Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "USD"
    }
}

enum Country {
    case UnitedStates, Spain, UK, Greece
}

enum CurrencyFactory {
    static func currency(for country:Country) -> Currency? {
        
        switch country {
        case .Spain, .Greece :
            return Euro()
        case .UnitedStates :
            return UnitedStatesDolar()
        default:
            return nil
        }
        
    }
}

let noCurrencyCode = "No Currency Code Available"

print(CurrencyFactory.currency(for: .Greece)?.code() ?? noCurrencyCode)
print(CurrencyFactory.currency(for: .Spain)?.code() ?? noCurrencyCode)
print(CurrencyFactory.currency(for: .UnitedStates)?.code() ?? noCurrencyCode)
print(CurrencyFactory.currency(for: .UK)?.code() ?? noCurrencyCode)

print("\n---------SECOND EXAMPLE-------------")
// Простой пример
class Product {
    
    let price: Int
    let name: String
    
    init(price: Int, name: String) {
        self.price = price
        self.name = name
    }
    
    func getTotalPrice(sum: Int) -> Int {
        return price + sum
    }
    
    func saveObject() {
        print(" Saving product \(name) to database")
    }
    
}

class Toy: Product {
    
    override func saveObject() {
        print(" Saving product \(name) into TOYS database")
    }
    
}

class Car: Product {
    
    override func saveObject() {
        print(" Saving product \(name) into CARS database")
    }
    
}

class ProductGenerator {
    
    func getProduct(price: Int) -> Product? {
        if price > 0 && price < 100 {
            let product = Toy(price: price, name: "Transformer")
            return product
        }
        
        if price > 100 {
            let product = Car(price: price, name: "Audi")
            return product
        }
        
        return nil
    }
    
}

func saveExpenses(_ aPrice: Int) {
    let pg = ProductGenerator()
    let expensive = pg.getProduct(price: aPrice)
    expensive?.saveObject()
}


saveExpenses(50)
saveExpenses(80)
saveExpenses(90)
saveExpenses(150)
saveExpenses(560)
saveExpenses(99)
saveExpenses(101)
