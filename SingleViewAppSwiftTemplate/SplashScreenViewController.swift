//
//  SplashScreenViewController.swift
//  Bout Time App
//
//  Created by Jevaughn McKenzie on 2/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameWithDelay(seconds: 2)
    }
    
    func loadGameWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.performSegue(withIdentifier: "startGame", sender: nil)
        }
    }
}
