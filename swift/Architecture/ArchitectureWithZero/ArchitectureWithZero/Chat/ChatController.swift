//
//  ChatController.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ChatController: NSObject {
    
    weak var chatViewController: ChatViewController?
    
    private let dataProvider = ChatDataProvider()
    private lazy var chatInteractor = ChatInteractor(dataProvider: dataProvider)
    private lazy var dataSource = ChatDataSource(dataProvider: dataProvider)
    
    init(chatViewController: ChatViewController) {
        self.chatViewController = chatViewController
    }
    
    var tableView: UITableView? {
        return chatViewController?.tableView
    }
    
    func delegating() {
        tableView?.delegate = self
        tableView?.dataSource = dataSource
    }
    
    func sendButtonClicked(with text: String?) {
        guard let text = text, !text.isEmpty else {
            chatViewController?.showAlert(with: "Error", message: "Field is empty")
            return
        }
        
        chatInteractor.fetchMessages()
        chatInteractor.send(text: text)
        tableView?.reloadData()
    }
    
    func viewDidLoad() {
        delegating()
        chatInteractor.fetchMessages()
        tableView?.reloadData()
        chatViewController?.textField.text = nil
    }
    
}

extension ChatController: UITableViewDelegate { }
