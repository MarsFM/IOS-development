//
//  ViewController.swift
//  ChessGameApp
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newGameView: UIView!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var newGameBarButton: UIBarButtonItem!
    
    var viewModel = MainViewModel()
    var managedContext: NSManagedObjectContext!
    var dataSource: MainDataSource!
    
    var games: [ChessGame] = [] {
        didSet {
            viewModel.games = games
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = MainDataSource(viewModel: viewModel, managedContext: managedContext)
        prepareUI()
        delegating()
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkGameOnEmpty), name: NSNotification.Name("deleteGame"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchChessGames()
        checkGameOnEmpty()
    }
    
    private func fetchChessGames() {
        let fetchRequest: NSFetchRequest<ChessGame> = ChessGame.fetchRequest()
        do {
            if let managedContext = managedContext {
                games = try managedContext.fetch(fetchRequest)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func checkGameOnEmpty() {
        if (!viewModel.games.isEmpty) {
            hideNewGameUI(true)
        } else {
            hideNewGameUI(false)
        }
    }
    
    private func prepareUI() {
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    
    private func hideNewGameUI(_ value: Bool) {
        newGameView.isHidden = value
        newGameButton.isHidden = value
        newGameBarButton.isEnabled = value
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NewGameSegue") {
            let nc = segue.destination as! UINavigationController
            let dvc = nc.topViewController as! DescriptionGameTableViewController
            if let managedContext = managedContext {
                 dvc.managedContext = managedContext
            }
        }
        
        if (segue.identifier == "GameSegue") {
            let nv = segue.destination as! UINavigationController
            let dvc = nv.topViewController as! SOGViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                dvc.viewModel = viewModel.goToSreenOfSteps(index: indexPath.row)
                dvc.managedContext = managedContext
                dvc.isEdit = true
            }
        }
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {} //unwind segue
    
    @IBAction func createNewGameButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "NewGameSegue", sender: nil)
    }
    
    @IBAction func createNewGameBarButtonClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "NewGameSegue", sender: nil)
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GameSegue", sender: nil)
    }
    
}
