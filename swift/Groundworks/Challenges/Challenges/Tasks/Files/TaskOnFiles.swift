//
//  Files.swift
//  Challenges
//
//  Created by ilya on 23.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class TaskOnFiles {
    
    func createFile(name: String) -> URL {
        let documentsPath = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
        return documentsPath.appendingPathComponent(name).appendingPathExtension("txt")
    }
    
    // 1
    func challenge1(filename: String, lineCount: Int) -> String {
        guard let file = Bundle.main.url(forResource: filename, withExtension: "txt") else { return ""}
        guard let string = try? String(contentsOf: file) else { return "" }
        var result: [String] = []
        var arr = string.components(separatedBy: "\n")
        arr.removeLast()
        arr.reverse()
        
        for i in 0..<min(lineCount, arr.count) {
            result.append(arr[i])
        }
        
        return result.joined(separator: ", ")
    }
    
    // 2
    func challenge2(log message: String, to logFile: String) {
        guard let file = Bundle.main.url(forResource: logFile, withExtension: "txt") else { return }
        var string = (try? String(contentsOf: file)) ?? ""
        string.append(contentsOf: "\(currentDate()) - \(message)\n")
        do {
            try string.write(to: file, atomically: true, encoding: .utf8)
        } catch {
            print("Error save the message to logFile")
        }
    }
    
    private func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: Date())
    }
    
    // 3
    func challenge3() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    // 4
    func challenge4() -> [String] {
        let directory = challenge3().path
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
        
        var jpegs = [String]()
        
        for file in files {
            if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
                guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { continue }
                guard let creationDate = attributes[.creationDate] as? Date else { continue }
                
                if creationDate < Date(timeIntervalSinceNow: -60 * 60 * 48) {
                    jpegs.append(file.lastPathComponent)
                }
            }
        }
        
        return jpegs
    }
    
    // 5
    func challenge5() -> Bool {
        let fm = FileManager.default
        var from = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        from.appendPathComponent("jpgs")
        var to = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        to.appendPathComponent("jpgs_copy")
        
        guard fm.fileExists(atPath: from.path) else { return true }
        
        do {
            try fm.copyItem(at: from, to: to)
        } catch {
            print("Error copy failed: \(error.localizedDescription)")
        }
        
        return true
    }
    
    //6
    func challenge6(count: String) -> Int {
        let filename = Bundle.main.url(forResource: "c6_1", withExtension: "txt")
        guard let inputString = try? String(contentsOf: filename!) else { return 0 }
        var nonletters = CharacterSet.letters.inverted
        nonletters.remove("'")
        let allWords = inputString.components(separatedBy: nonletters)
        
        let wordsSet = NSCountedSet(array: allWords)
        
        return wordsSet.count(for: count)
    }
    
    //7
    func challenge7()  {
        let fm = FileManager.default
        var directoryURL = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        directoryURL.appendPathComponent("test")
        
        guard let files = fm.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return }
        var duplicates = Set<String>()
        
        for case let file as URL in files {
            guard file.hasDirectoryPath == false else { continue }
            
            let filename = file.lastPathComponent
            duplicates.insert(filename)
        }
        
    }
    
    //8
    func challenge8(in directory: String) -> [String] {
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        
        guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
        
        var returnValue = [String]()
        
        for file in files {
            guard file.hasDirectoryPath == false else { continue }
            
            if fm.isExecutableFile(atPath: file.path) {
                returnValue.append(file.lastPathComponent)
            }
        }
        
        return returnValue
    }
    
    // 9
    func challenge9(in directory: String) {
        let fm = FileManager.default
        let directoryURL = URL(fileURLWithPath: directory)
        guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
        
        for file in files {
            guard file.pathExtension == "jpeg" || file.pathExtension == "jpg" else { continue}
            guard let image = UIImage(contentsOfFile: file.path) else { continue }
            guard let png = image.pngData() else { continue }
            
            let newFilename = file.deletingPathExtension().appendingPathExtension("png")
            _ = try? png.write(to: newFilename)
        }
    }
    
}
