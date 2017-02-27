//
//  GameOverViewController.swift
//  Bout Time App
//
//  Created by Jevaughn McKenzie on 2/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var finalScore: UILabel!
    
    var score: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalScore.text! = score
    }
    
    @IBAction func playAgain(_ sender: Any) {
    }
 
    
}
