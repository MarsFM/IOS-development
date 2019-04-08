//
//  ViewController.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newGameView: UIView!
    @IBOutlet weak var newGameButton: UIButton!
    
    var games: [Game] = [] {
        didSet {
            dataSource.games = games
            tableView.reloadData()
        }
    }
    
    var dataSource = MainDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)
        delegating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (!games.isEmpty) {
            hideNewGameUI(true)
        } else {
            hideNewGameUI(false)
        }
    }
    
    private func hideNewGameUI(_ value: Bool) {
        newGameView.isHidden = value
        newGameButton.isHidden = value
    }
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NewGameSegue") {
            let nc = segue.destination as! UINavigationController
            let dvc = nc.topViewController as! DescriptionGameTableViewController
            dvc.addToGames = { game in
               self.games.append(game)
            }
        }
        
        if (segue.identifier == "GameSegue") {
            let nv = segue.destination as! UINavigationController
            let dvc = nv.topViewController as! SOGViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                dvc.game = games[indexPath.row]
                dvc.isEdit = true
            }
        }
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {}
    
    @IBAction func createNewGameButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "NewGameSegue", sender: nil)
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GameSegue", sender: nil)
    }
    
}
