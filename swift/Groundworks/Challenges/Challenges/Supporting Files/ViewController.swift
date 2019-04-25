//
//  ViewController.swift
//  Challenges
//
//  Created by ilya on 22.04.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let matches = PatternMathing()
//        matches.partialMatches()
        matches.simpleFor()
        matches.matchingOptionals()
        
        let filesTask = TaskOnFiles()
        filesTask.challenge2(log: "Hello", to: "challenge2")
        
        filesTask.challenge3()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
