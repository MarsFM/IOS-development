//
//  String.swift
//  Challenges
//
//  Created by ilya on 21.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class TasksOnString {
    
    // 1 letters unique
    func challenge1a(input: String) -> Bool {
        
        var dict: [Character: Int] = [:]
        
        for letter in input {
            dict[letter, default: 0] += 1
            if dict[letter]! > 1 {
                return false
            }
        }
        
        return true
    }
    
    func challenge1b(input: String) -> Bool {
        return Set(input).count == input.count
    }
    
    // 2 Palindrom
    func challenge2a(input: String) -> Bool  {
        var str = input.lowercased()
        
        for _ in 0..<str.count / 2 {
            if str.removeFirst() != str.removeLast() {
                return false
            }
        }
        
        return true
    }
    
    func challenge2b(input: String) -> Bool  {
        let lowercase = input.lowercased()
        return lowercase.reversed() == Array(lowercase)
    }
    
    // 3 Do two strings contain the same characters? 
    func challenge3(string1: String, string2: String) -> Bool {
        var str = string2
        
        for letter in string1 {
            if let index = str.index(of: letter) {
                str.remove(at: index)
            } else {
                return false
            }
        }
        
        return str.count == 0
    }
    
    
    // 4 code down
    
    // 5 Подсчитать персонажей
    
    func challenge5a(input: String, count: Character) -> Int {
        var i = 0
        for letter in input {
            if letter == count {
                i += 1
            }
        }
        return i
    }
    
    func challenge5b(input: String, count: Character) -> Int {
        return input.reduce(0) {
            if $1 == count {
                return $0 + 1
            }
            
            return $0
        }
    }
    
    func challenge5c(input: String, count: String) -> Int {
        let modified = input.replacingOccurrences(of: count, with: "")
        
        return input.count - modified.count
    }
    
    // 6 Remove duplicate letters from a string
    func challenge6a(input: String) -> String {
        var letters = Set<Character>()
        
        return input.reduce("") {
            if !letters.contains($1) {
                letters.insert($1)
                return $0 + "\($1)"
            }
            return $0
        }
    }
    
    func challenge6b(input: String) -> String {
        let array = input.map { String($0) }
        let set = NSOrderedSet(array: array)
        let letters = Array(set) as! Array<String>
        return letters.joined()
    }
    
    // 7
    func challenge7(input: String) -> String {
        return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
    }
    
    // abcde eabcd
    func challenge8(string1: String, string2: String) -> Bool {
        var str = string1
        var deleteStr = ""
        var matchStr = ""
        
        for _ in 0..<str.count {
            let letter = str.removeLast()
            deleteStr += String(letter)
            if let rangeMatch = string2.range(of: str) {
                matchStr = String(string2[rangeMatch])
                break
            }
        }
        
        if (deleteStr.reversed() + matchStr == string2) {
            return true
        }
        
        return false
    }
    
    // 8
    func challenge8b(string1: String, string2: String) -> Bool {
        guard string1.count == string2.count else { return false }
        let combined = string1 + string1
        return combined.contains(string2)
    }
    
    // 9
    func challenge9(input: String) -> Bool {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        let arr = input.map { String($0).lowercased() }
        let set = Set(arr)
        let str = set.sorted().joined().trimmingCharacters(in: .whitespaces)
        
        return alphabet == str
    }
    
    func challenge9b(input: String) -> Bool {
        let set = Set(input.lowercased())
        let letters = set.filter { $0 >= "a" && $0 <= "z"}
        return letters.count == 26
    }
    
    // 10
    func challenge10(input: String) -> (Int, Int) {
        var dict: [String: Int] = [:]
        
        let vowels = "aeiou"
        let consonants = "bcdfghjklmnpqrstvwxyz"
        
        for letter in input.lowercased() {
            if vowels.contains(letter) {
                dict["vowels", default: 0] += 1
            }
            
            if consonants.contains(letter) {
                dict["consonants", default: 0] += 1
            }
        }
        let vowelCount = dict["vowels"]!
        let consonantCount = dict["consonants"]!
        
        return (vowelCount, consonantCount)
    }
    
    // 11
    func challenge11(firstStr: String, secondStr: String) -> Bool {
        guard firstStr.count == secondStr.count else { return false }
        
        let rightCountLetters = 3
        var matchCountLetters = 0
        
        let arrFirst = Array(firstStr)
        let arrSecond = Array(secondStr)
        
        for (index, letter) in arrFirst.enumerated() {
            if arrSecond[index] == letter {
                matchCountLetters += 1
            }
        }
        
        return (firstStr.count - matchCountLetters) <= rightCountLetters
    }
    
    // 12
    func challenge12(input: String) -> String {
        let words = input.split(separator: " ")
        var currentPrefix = ""
        var bestPrefix = ""
        
        guard let first = words.first else { return "" }
        
        for letter in first {
            currentPrefix.append(letter)
            
            for word in words {
                if !word.hasPrefix(currentPrefix) {
                    return bestPrefix
                }
            }
            
            bestPrefix = currentPrefix
        }
        
        return bestPrefix
    }
    
    // 13
    func challenge13(input: String) -> String {
        var arr = input.map { String($0) }
        var result = arr[0]
        var count = 1
        for index in 0..<arr.count - 1 {
            if arr[index] == arr[index + 1] {
                count += 1
            } else {
                result += "\(count)\(arr[index+1])"
                count = 1
            }
        }
        
        return result + "\(count)"
    }
    
    // 14
    func challenge14(string: String, current: String = "") {
        let length = string.count
        let strArray = Array(string)
        if (length == 0) {
            print(current)
        } else {
            print(current)
            for i in 0..<length {
                let left = String(strArray[0..<i])
                let right = String(strArray[i+1..<length])
                
                challenge14(string: left + right, current: current + String(strArray[i]))
            }
        }
    }
    
    // 15
    func challenge15(input: String) -> String {
        let words = input.components(separatedBy: " ")
        let reversed = words.map { String($0.reversed()) }
        return reversed.joined(separator: " ")
    }
    
}

extension String {
    
    // 4 Does one string contain another?
    func fuzzyContains(input: String) -> Bool {
        return self.lowercased().contains(input.lowercased())
    }
    
    func fuzzyContainsB(input: String) -> Bool {
        return self.range(of: input, options: .caseInsensitive) != nil
    }
    
}
