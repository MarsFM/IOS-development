//
//  DataProvider.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

// ble
protocol ChatDataProvidable {
    func numberOfSenction() -> Int
    func numberOfRows(in section: Int) -> Int
    func set(messages: [[Message]])
    func getMessage(by indexPath: IndexPath) -> Message
}

class ChatDataProvider: ChatDataProvidable {

    typealias Model = Message
    private var models: [[Model]] = []
    
    func set(messages: [[Model]]) {
        self.models = messages
    }
    
    func numberOfSenction() -> Int {
        return models.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return models[section].count
    }
    
    func getMessage(by indexPath: IndexPath) -> Message {
        return models[indexPath.section][indexPath.row]
    }
    
}
