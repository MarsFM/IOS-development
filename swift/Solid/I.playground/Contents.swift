import UIKit

// Клиенты не должны зависить от методов, которые они используются
// Лучше создовать больше мелких, чем один универсальный

protocol IosSkills {
    var swift: Bool { get set }
    var objectC: Bool { get set }
}

protocol BackSkills {
    var ruby: Bool { get set }
    var php: Bool { get set }
}

protocol FrontSkills {
    var html: Bool { get set }
    var css: Bool { get set }
}

class CvIos: IosSkills {
    
    var swift: Bool
    var objectC: Bool
    
    init(swift: Bool, objectC: Bool) {
        self.swift = swift
        self.objectC = objectC
    }
    
}

class CvWebFrond: FrontSkills {
    
    var html: Bool
    var css: Bool
    
    init(html: Bool, css: Bool) {
        self.html = html
        self.css = css
    }
    
}

class CvWebBack: BackSkills {
    
    var ruby: Bool
    var php: Bool
    
    init(ruby: Bool, php: Bool) {
        self.ruby = ruby
        self.php = php
    }
    
}
