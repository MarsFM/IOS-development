import UIKit

// .self, .Type, .Protocol

// .TYPE (type(of:) Dynamic Metatypes)
struct SwiftRocks {
    static let author = "Bruno Rocha"
    func postArticle(name: String) {
        print(name)
    }
}

let blog: SwiftRocks = SwiftRocks()

let something = type(of: blog) // SwiftRocks.Type

let author: String = something.author
let instance: SwiftRocks = something.init()
instance.postArticle(name: "Ilya")


// .self (Static Metatypes)
// .self - это то, что Apple называет статическим метатипом - причудливое слово для обозначения типа объекта во время компиляции.

//myArray.append(String) - Error

func create(blog: SwiftRocks.Type) -> SwiftRocks {
    return blog.init()
}

var swiftRocks = create(blog: SwiftRocks.self)
swiftRocks.postArticle(name: "New Name")

SwiftRocks.author == SwiftRocks.self.author // Equal

let metatype: SwiftRocks.Type = SwiftRocks.self
metatype.author

let swift = SwiftRocks.self
swift.author

// Protocol Metatypes

protocol MyProtocol {}
struct MyType: MyProtocol {}
let meta: MyProtocol.Type = MyType.self // Now works!

let protMetatype: MyProtocol.Protocol = MyProtocol.self
