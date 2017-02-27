//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import WebKit







class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var upButton1: UIButton!
    @IBOutlet weak var upButton2: UIButton!
    @IBOutlet weak var upButton3: UIButton!
    
    @IBOutlet weak var downButton1: UIButton!
    @IBOutlet weak var downButton2: UIButton!
    @IBOutlet weak var downButton3: UIButton!
    
    var labelButtons = [UIButton]()
    var upButtons = [UIButton]()
    var downButtons = [UIButton]()
    
    @IBOutlet weak var timerAndAnswerResult: UIButton!
    
    var correctRounds = 0
    let totalRounds = 6
    var roundsShown = 0
    var finalAnswer = 0
    var timeLeft: Int = 60
    var timer: Timer!
    
    var selectedEventOrder = [Int]()
    var correctEventOrder = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showEvents()
        
    }
    
    // MARK: Main game
    
    // sets the events into the labels for a given round
    func showEvents() {
        
        // Button groups
        labelButtons = [
            button1, button2, button3, button4
        ]
        upButtons = [
            upButton1, upButton2, upButton3
        ]
        downButtons = [
            downButton1, downButton2, downButton3
        ]
        
        roundsShown += 1
        timeLeft = 60
        
        enableButtons(in: upButtons)
        enableButtons(in: downButtons)
        disableButtons(in: labelButtons)
        timerAndAnswerResult.isEnabled = false
        
        timerAndAnswerResult.setBackgroundImage(nil, for: .normal)
        
        
        var index = 0
        let displayedEvents = randomizeEvents(for: eventList)
        var singleChosenEvent: Int
        print(displayedEvents)
        
        // figuring out best place to run this fuction
        correctEventOrder = loadRightAnswer(for: displayedEvents)
        
        for label in labelButtons {
            singleChosenEvent = displayedEvents[index]
            label.setTitle(eventList[singleChosenEvent].event, for: .normal)
            index += 1
        }
        
        startTimer()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Buttons
    
    
    enum buttonTag: Int {
        case top
        case middle
        case bottom
    }
    
    func dopeButtons() {
        
        func curveButtons(in list: [UIButton]) {
            for button in list {
                button.layer.cornerRadius = 10
            }
        }
        
        curveButtons(in: labelButtons)
        curveButtons(in: upButtons)
        curveButtons(in: downButtons)
        
    }
    // MARK: Text Movement
    
    @IBAction func Up(_ sender: UIButton) {
        upButton1.tag = buttonTag.top.rawValue
        upButton2.tag = buttonTag.middle.rawValue
        upButton3.tag = buttonTag.bottom.rawValue
        
        switch sender.tag {
        case upButton1.tag:
            replace(adjacentButton: button2, with: button1)
        case upButton2.tag:
            replace(adjacentButton: button3, with: button2)
            
        case upButton3.tag:
            replace(adjacentButton: button4, with: button3)
        default:
            // FIXME: place correct error message
            print("Error")
        }
    }
    
    @IBAction func Down(_ sender: UIButton) {
        downButton1.tag = buttonTag.top.rawValue
        downButton2.tag = buttonTag.middle.rawValue
        downButton3.tag = buttonTag.bottom.rawValue
        
        switch sender.tag {
        case downButton1.tag:
            replace(adjacentButton: button1, with: button2)
        case downButton2.tag:
            replace(adjacentButton: button2, with: button3)
            
        case downButton3.tag:
            replace(adjacentButton: button3, with: button4)
        default:
            // FIXME: place correct error message
            print("Error")
        }
    }
    
    
    func replace(adjacentButton: UIButton, with button: UIButton) {
        if let targetText = adjacentButton.currentTitle, let replacementText = button.currentTitle  {
            let textBeingMoved = targetText
            let newAdjacentText = replacementText
            adjacentButton.setTitle(newAdjacentText, for: .normal)
            button.setTitle(textBeingMoved, for: .normal)
        }
    }
    
    func disableButtons(in buttonGroup: [UIButton]) {
        for button in buttonGroup {
            button.isEnabled = false
        }
    }
    
    func enableButtons(in buttonGroup: [UIButton]) {
        for button in buttonGroup {
            button.isEnabled = true
        }
    }
    
    
    // MARK: Checking Answers
    
    func loadRightAnswer(for displayedEvents: [Int]) -> [Int] {
        
        var correctOrder = [Int]()
        for displayedEvent in displayedEvents {
            correctOrder.append(eventList[displayedEvent].year)
        }
        
        correctOrder = correctOrder.sorted()
        print(correctOrder)
        return correctOrder
        
    }
    
    func loadSelectedAnswer(in labelButtons: [UIButton]) -> [Int] {
        
        selectedEventOrder = [Int]()
        for button in labelButtons {
            for event in eventList {
                if event.event == button.currentTitle {
                    selectedEventOrder.append(event.year)
                }
            }
        }
        
        print(selectedEventOrder)
        return selectedEventOrder
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            timer.invalidate()
            checkAnswer()
        }
    }
    
    
    func checkAnswer(){
        
        disableButtons(in: upButtons)
        disableButtons(in: downButtons)
        enableButtons(in: labelButtons)
        timerAndAnswerResult.isEnabled = true
        
        let finalAnswer = loadSelectedAnswer(in: labelButtons)
        timerAndAnswerResult.setTitle(nil, for: .normal)
        timerAndAnswerResult.setTitle(nil, for: .selected)
        
        if correctEventOrder == finalAnswer {
            timerAndAnswerResult.setBackgroundImage(#imageLiteral(resourceName: "next_round_success.png"), for: .normal)
            correctRounds += 1
        } else {
            timerAndAnswerResult.setBackgroundImage(#imageLiteral(resourceName: "next_round_fail.png"), for: .normal)
        }
        
    }
    
    // MARK: Screen Transitions
    
    @IBAction func nextRound(_ sender: UIButton) {
        
    }
    
    @IBAction func openWebView(_ sender: UIButton) {
        
        performSegue(withIdentifier: "moreInfo", sender: nil)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        var returnResult = true
        
        if identifier == "gameOver" {
            if roundsShown == totalRounds {
                returnResult = true
                
            } else {
                showEvents()
                returnResult = false
            }
        }
        
        return returnResult
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "moreInfo" {
            
            if let destination = segue.destination as? WebViewController {
                var selectedEvent: String?
                
                if button1.isHighlighted == true {
                    selectedEvent = button1.currentTitle
                } else if button2.isHighlighted == true {
                    selectedEvent =  button2.currentTitle
                } else if button3.isHighlighted == true {
                    selectedEvent =  button3.currentTitle
                }else if button4.isHighlighted == true {
                    selectedEvent =  button4.currentTitle
                }
                
                for event in eventList {
                    if selectedEvent == event.event {
                        destination.link = event.info
                    }
                }
            }
        }
        
        if segue.identifier == "gameOver" {
            if let destination = segue.destination as? GameOverViewController {
                destination.score = "\(correctRounds)/\(totalRounds)"
            }
        }
    }
    
    // MARK: Helper Methods
    
    func countdown() {
        
        timeLeft -= 1
        timerAndAnswerResult.setTitle("0:\(timeLeft)", for: .normal)
        if timeLeft == 0 {
            timer.invalidate()
            checkAnswer()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
}
