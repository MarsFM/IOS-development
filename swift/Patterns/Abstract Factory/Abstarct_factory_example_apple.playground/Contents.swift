import UIKit

class IPhoneFactory {
    
}

class GenericIPad {
    var osName: String?
    var productName: String?
    var screenSize: Float?
}

class GenericIPhone {
    var osName: String?
    var productName: String?
}

class AppleIPhone: GenericIPhone {
    override init() {
        super.init()
        self.productName = "iPhone"
        self.osName = "iOS"
    }
}
class AppleIPad: GenericIPad {
    override init() {
        super.init()
        self.productName = "iPad"
        self.osName = "iOS"
        self.screenSize = 7.7
    }
}

class ChinaPhone: GenericIPhone {
    override init() {
        super.init()
        self.productName = "Ляо-Фон"
        self.osName = "Ведроид"
    }
}

class ChinaPad: GenericIPad {
    override init() {
        super.init()
        self.productName = "Сяо-Пад"
        self.osName = "Окна-ЦЕ"
        self.screenSize = 12.1
    }
}


class AppleFactory: IPhoneFactory {
    func getIPhone() -> GenericIPhone {
        let iPhone = AppleIPhone()
        return iPhone
    }
    
    func getIPad() -> GenericIPad {
        let iPad = AppleIPad()
        return iPad
    }
}

class ChinaFactory: IPhoneFactory {
    
    func getIPhone() -> GenericIPhone {
        let phone = ChinaPhone()
        return phone
    }
    
    func getIPad() -> GenericIPad {
        let pad = ChinaPad()
        return pad
    }
    
}

var isThirdWorld: Bool = false

func getFactory() -> IPhoneFactory {
    if (isThirdWorld) {
        return ChinaFactory()
    }
    return AppleFactory()
}

let fac = getFactory()
var iPhone = GenericIPhone()
var iPad = GenericIPad()

if let factory = fac as? ChinaFactory {
    iPhone = factory.getIPhone()
    iPad = factory.getIPad()
}
if let factory = fac as? AppleFactory {
    iPhone = factory.getIPhone()
    iPad = factory.getIPad()
}

print("iPad: \(iPad.productName!), os name: \(iPad.osName!), screensize: \(iPad.screenSize!)")

print("iPhone: \(iPhone.productName!), os name: \(iPhone.osName!)")
