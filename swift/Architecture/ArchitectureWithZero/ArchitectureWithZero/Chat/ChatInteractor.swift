//
//  ChatInteractor.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class ChatInteractor {
    
    private let chatService: ChatService = ChatServiceImplemenation()
    
    var dataProvider: ChatDataProvidable?
    
    init(dataProvider: ChatDataProvidable) {
        self.dataProvider = dataProvider
    }
    
    func send(text: String) {
        chatService.sendMeesage(text: text) { (result) in
            print("Message has been sender with result: \(result)")
        }
    }
    
    func fetchMessages() {
        chatService.fetchMessages { (messages) in
            self.dataProvider?.set(messages: self.split(messages: messages))
        }
    }
    
    func split(messages: [Message]) -> [[Message]] {
        var splittedData: [[Message]] = []
        for message in messages {
            splittedData.append([message])
        }
        
        return splittedData
    }
    
}
