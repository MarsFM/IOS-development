//
//  TasksOfNumber.swift
//  Challenges
//
//  Created by ilya on 24.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class TasksOfNumber {
    
    // 1
    func challenge1(number: Int) -> String {
        for i in 1...100 where number == i {
            if number % 3 == 0 && number % 5 == 0 {
                return "Fizz Buzz"
            } else if number % 3 == 0 {
                return "Fizz"
            } else if number % 5 == 0 {
                return "Buzz"
            } else {
                return "\(i)"
            }
        }
        return ""
    }
    
    // 2
    func challenge2(minNumber: Int, maxNumber: Int) -> Int {
        let randomNumber = Int.random(in: minNumber ... maxNumber)
        return randomNumber
    }
    
    //3
    func challenge3(number: Int, power: Int) -> Int {
        guard (number > 0) && (power > 0) else { return 0 }
        if (power == 1) { return number }
        return number * challenge3(number: number, power: power - 1)
    }
    
    //4
    func challenge4(n1: inout Int, n2: inout Int) -> (Int, Int) {
        guard (n1 > 0) && (n2 > 0) else { return (-1, -1) }
        (n1, n2) = (n2, n1)
        return (n1, n2)
    }
    
    //5
    func challenge5(n: Int) -> Bool {
        guard n > 0 else { return false }
        if n == 1 { return true }
        for i in 2..<n {
            if (n % i == 0) {
                return false
            }
        }
        
        return true
    }
    
    //6
    func challenge6(n: Int) -> (Int, Int){
        guard n > 0 else { return (0,0)}
        var nextNumber = n
        var prevNumber = n
        let binary = String(n, radix: 2)
        let arr = binary.filter { $0 == "1" }
        
        var p = ""
        while p.count != arr.count {
            nextNumber += 1
            p = String(nextNumber, radix: 2).filter { $0 == "1" }
        }
        
        var m = ""
        while m.count != arr.count {
            prevNumber -= 1
            m = String(prevNumber, radix: 2).filter { $0 == "1" }
        }
        
        return (prevNumber, nextNumber)
    }
    
    //7
    func challenge7(n: Int) -> Int {
        guard n > 0 else { return 0 }
        var binary = String(n, radix: 2)
        let countZero = 8 - binary.count
        binary = String(repeating: "0", count: countZero) + binary
        var arr = Array(binary)
        arr.reverse()
        
        let reverseBinary = String(arr)
        return Int(reverseBinary, radix: 2) ?? 0
    }
    
    //8
    func challenge8(n: String) -> Bool {
        return n.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil
    }
    
    //9
    func challenge9a(input: String) -> Int {
        var currentNumber = ""
        var amount = 0
        
        for letter in input {
            if Int(String(letter)) != nil {
                currentNumber += String(letter)
            } else {
                amount += Int(currentNumber) ?? 0
                currentNumber = ""
            }
        }
        
        amount += Int(currentNumber) ?? 0
        return amount
    }
    
    func challenge9b(input: String) -> Int {
        let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        let allNumbers = matches.compactMap { Int((input as NSString).substring(with: $0.range)) }
        return allNumbers.reduce(0, +)
    }
    
    func challenge10(number: Int) -> Int {
        guard number != 1 else { return 1 }
        
        for i in 0...number / 2 + 1 {
            if i * i > number {
                return i - 1
            }
        }
        
        return 0
    }

}
