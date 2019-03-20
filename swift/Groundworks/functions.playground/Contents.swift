import UIKit

// Декларативным Программированием?



// Первый способ решения — "Императивный"
var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // mutable

for i in 0..<numbers.count {
    let timesTen = numbers[i] * 10
    numbers[i] = timesTen
}

print(numbers)

// "Функциональный" подход
let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // immutable

extension Array where Element == Int {
    
    func timesTen() -> [Int] {
        var output = [Int]()
        
        for num in self {
            output.append(num * 10)
        }
        
        return output
    }
    
}

let result = numbers.timesTen()
print(numbers2) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(result) //[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

// map , filter , reduce , forEach , flatMap , compactMap ,sorted


// MAP
let numbersMap = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


let reuslt = numbersMap.map { (x) -> Int in
    return x * 10
}

print("Map - \(result)")

// CompactMap

let possibleNumbers = ["1", "2", "three", "///4///", "5"]

let compactMapped = possibleNumbers.compactMap { str in Int(str) }
print("CompactMap \(compactMapped)")

let strings = ["https://demo0989623.mockable.io/car/1",
               "https://i.imgur.com/Wm1xcNZ.jpg"]
let validateURLs = strings.compactMap { str in URL(string: str) }

print(validateURLs)

let mathString: String = "12-37*2/5+44"

let numbers1 = mathString.components(separatedBy: ["-", "*", "+", "/"]).compactMap(Int.init)
print(numbers1)

let b = Int.init("1")
print(b!)

// ZIP

var arr1 = [1,2,3,4,5,6,7]
var arr2 = [1,2,3,4,5,6,7]

var points = zip(arr1, arr2)
let averagePoints = points.map { $0 + $1 }
print(averagePoints)

// FILTER

let numbersFilter = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filted = numbersFilter.filter { $0 % 2 == 0}
print(filted)

var images = [6, 22, 8, 14, 16, 0, 7, 9]
var removedIndexes = [2,5,0,6]

var images1 = images.enumerated().filter { !removedIndexes.contains($0.offset) }.map { $0.element }
print(images1)



// REDUCE

let sum = Array(1...10).reduce(0) { (result, number) -> Int in
    return result + number
}
print(sum)

// Separate Tuples
let arr = [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
let (arr3, arr4) = arr.reduce(([], [])) { ($0.0 + [$1.0], $0.1 + [$1.1]) }

print(arr3) // ["one", "two", "three", "four"]
print(arr4) // [1, 2, 3, 4]


// FlatMap(понижаем уровень вложоности), if case let

let maybeNumbers = ["42", "7", "three", "///4///", "5"]

let firstNumber = maybeNumbers.map (Int.init).first?.flatMap { $0 }
type(of: firstNumber)
