//
//  ChatServiceImplemenation.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class ChatServiceImplemenation: ChatService {
    
    private var messages: [Message] = []
    
    func fetchMessages(with completion: @escaping ([Message]) -> ()) {
        completion(messages)
    }
    
    func sendMeesage(text: String, with completion: @escaping (SendMessageResult) -> ()) {
       let message = Message(text: text)
        messages.append(message)
        completion(.success)
    }
    
}
