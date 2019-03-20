//
//  ChatService.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

protocol ChatService {
    func fetchMessages(with completion: @escaping ([Message]) -> ())
    func sendMeesage(text: String, with completion: @escaping (SendMessageResult) -> ())
}
