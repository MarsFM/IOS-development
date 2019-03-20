//
//  ChatDataSource.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ChatDataSource: NSObject, UITableViewDataSource {
    
    var dataProvider: ChatDataProvidable
    
    init(dataProvider: ChatDataProvidable) {
        self.dataProvider = dataProvider
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.numberOfSenction()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataProvider.getMessage(by: indexPath).text
        return cell
    }
    
}
