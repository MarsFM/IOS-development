//
//  ViewController.swift
//  Movies
//
//  Created by ilya on 13.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ListMoviesViewController: UIViewController, ViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topButton: UIButton!
    
    let configuration: ConfigurationProtocol = ListMoviesConfiguration()
    var presenter: PresenterProtocol!
    var dataSource: ListMoviesDataSource!
    
    var isScrolling = false
    
    var button: UIButton {
        return topButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configurate(with: self)
        delagating()
        
        presenter.fetchMovies()
        prepareUIForTopButton()
    }
    
    private func delagating() {
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func getTableView() -> UITableView {
        return tableView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailMovieViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        dvc.viewModel = presenter.giveViewModelToDetailController(at: indexPath.row)
    }
    
    private func prepareUIForTopButton() {
        topButton.layer.cornerRadius = topButton.frame.width / 2
        topButton.clipsToBounds = true
    }
    
    @IBAction func topButtonClicked(_ sender: UIButton) {
        presenter.scrollContentToUp()
    }
    
}

extension ListMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailMovieSegue", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ListMoviesViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter.nextPage(scrollView: scrollView, isScrolling: isScrolling) {
            self.tableView.reloadData()
            self.isScrolling = false
        }
    }
    
}
