//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Michelle Ho on 10/29/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var appData = AppData.shared
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a4: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    var answerSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            if (answerSelected != "") {
                performSegue(withIdentifier: "segueToAnswer", sender: self)
            }
        } else if (sender.direction == .left) {
            appData.numGuessed = 0
            appData.numRight = 0
            performSegue(withIdentifier: "segueBackHome", sender: self)
        }
    }
    
    @IBAction func a1Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a1.titleLabel!.text!
        a1.backgroundColor = UIColor.lightGray
        a1.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    @IBAction func a2Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a2.titleLabel!.text!
        a2.backgroundColor = UIColor.lightGray
        a2.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    @IBAction func a3Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a3.titleLabel!.text!
        a3.backgroundColor = UIColor.lightGray
        a3.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    @IBAction func a4Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a4.titleLabel!.text!
        a4.backgroundColor = UIColor.lightGray
        a4.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    func buttonClicked() {
        a1.backgroundColor = UIColor.white
        a1.setTitleColor(UIColor.black, for: .normal)
        
        a2.backgroundColor = UIColor.white
        a2.setTitleColor(UIColor.black, for: .normal)
        
        a3.backgroundColor = UIColor.white
        a3.setTitleColor(UIColor.black, for: .normal)
        
        a4.backgroundColor = UIColor.white
        a4.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if (answerSelected != "") {
            performSegue(withIdentifier: "segueToAnswer", sender: self)
        }
    }
    
    func newQuestion() {
        let numGuessed = appData.numGuessed
        question.text = appData.categories[appData.topicIndex].questions[numGuessed].question
        a1.setTitle(appData.categories[appData.topicIndex].questions[numGuessed].answers[0], for: .normal)
        a2.setTitle(appData.categories[appData.topicIndex].questions[numGuessed].answers[1], for: .normal)
        a3.setTitle(appData.categories[appData.topicIndex].questions[numGuessed].answers[2], for: .normal)
        a4.setTitle(appData.categories[appData.topicIndex].questions[numGuessed].answers[3], for: .normal)
        
        let correctAnswer = Int(appData.categories[appData.topicIndex].questions[numGuessed].correctAnswer)! - 1
        appData.answerText = appData.categories[appData.topicIndex].questions[numGuessed].answers[correctAnswer]
        appData.questionText = appData.categories[appData.topicIndex].questions[numGuessed].question
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        appData.numGuessed = 0
        appData.numRight = 0
        performSegue(withIdentifier: "segueBackHome", sender: self)
    }

}
