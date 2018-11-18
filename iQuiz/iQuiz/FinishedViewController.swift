//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Michelle Ho on 11/4/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    var appData = AppData.shared
    
    @IBOutlet weak var reaction: UILabel!
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        numRight.text = String(appData.numRight)
        let totalQuestions = appData.categories[appData.topicIndex].questions.count
        
        if (appData.numRight == totalQuestions) {
            reaction.text = "Perfect!"
        } else {
            reaction.text = "Better Luck Next Time :("
        }
        result.text = "You got " + String(appData.numRight) + " out of " + String(totalQuestions) + " questions right"
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            backButtonPressed(sender)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackHome", sender: self)
        appData.numGuessed = 0
        appData.numRight = 0
    }
    
}
