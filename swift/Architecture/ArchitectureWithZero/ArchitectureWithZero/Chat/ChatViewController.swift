//
//  ViewController.swift
//  ArchitectureWithZero
//
//  Created by ilya on 04.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    private lazy var controller: ChatController = ChatController(chatViewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.viewDidLoad()
    }

    @IBAction func sendButtonClicked() {
        let text = textField.text
        controller.sendButtonClicked(with: text)
    }
    
    func showAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
}
