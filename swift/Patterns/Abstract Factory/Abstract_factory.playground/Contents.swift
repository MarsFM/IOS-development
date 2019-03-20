import UIKit

// Example 1

protocol ChairType { // Стул
    var name: String { get set }
    var type: String { get set }
}

protocol SofaType { // Диван
    var name: String { get set }
    var type: String { get set }
}

protocol TableType { // Table
    var name: String { get set }
    var type: String { get set }
}

class VChair: ChairType {
    var name: String = "Стул"
    var type: String = "Стул в стили V"
}

class MChair: ChairType {
    var name: String = "Стул"
    var type: String = "Стул в стили M"
}

struct VSofa: SofaType {
    var name: String = "Диван"
    var type: String = "Диван в стили V"
}

struct MSofa: SofaType {
    var name: String = "Диван"
    var type: String = "Диван в стили M"
}

struct VTable: TableType {
    var name: String = "Стол"
    var type: String = "Стол в стили V"
}

struct MTable: TableType {
    var name: String = "Стол"
    var type: String = "Стол в стили M"
}

protocol FurnitureFactory {
    func createChair() -> ChairType
    func createSofa() -> SofaType
    func createTable() -> TableType
}

class VictorianFurnitureFactory: FurnitureFactory {
    func createChair() -> ChairType {
        return VChair()
    }
    
    func createSofa() -> SofaType {
        return VSofa()
    }
    
    func createTable() -> TableType {
        return VTable()
    }
    
}

class ModernFurnitureFactory: FurnitureFactory {
    func createChair() -> ChairType {
        return MChair()
    }
    
    func createSofa() -> SofaType {
        return MSofa()
    }
    
    func createTable() -> TableType {
        return MTable()
    }
    
}

enum TypeFactory {
    case Modern
    case Victorian
}

func getFactory(typeFactory: TypeFactory) -> FurnitureFactory {
    switch typeFactory {
    case .Victorian: return VictorianFurnitureFactory()
    case .Modern: return ModernFurnitureFactory()
    }
}

let factory = getFactory(typeFactory: .Victorian)

if let modernFactory = factory as? ModernFurnitureFactory {
    let mChair = modernFactory.createChair()
    let mSofa = modernFactory.createSofa()
    let mTable = modernFactory.createTable()
    mChair.type
    mSofa.type
    mTable.type
}

if let victorianFactory = factory as? VictorianFurnitureFactory {
    let vChair = victorianFactory.createChair()
    let vSofa = victorianFactory.createSofa()
    let vTable = victorianFactory.createTable()
    vChair.type
    vSofa.type
    vTable.type
}
