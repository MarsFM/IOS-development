//
//  MainDataSource.swift
//  ChessGameApp
//
//  Created by ilya on 04.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class MainDataSource: NSObject, UITableViewDataSource {
    
    var games: [Game] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        let game = games[indexPath.row]
        cell.nameLabel.text = game.name
        cell.typeColorLabel.text = game.colorOfChess.rawValue
        if let description = game.description {
            cell.descriptionLabel.text = description
        }
        return cell
    }
    
}
