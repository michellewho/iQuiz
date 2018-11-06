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
    
    var numRight = 0
    
    var questionCount = 0
    
    
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
            performSegue(withIdentifier: "segueToAnswer", sender: self)
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
    
    func newQuestion() {
        let numGuessed = appData.numGuessed
        switch appData.topicIndex {
        case 0:
            question.text = appData.popQuestions[numGuessed]
            appData.questionText = appData.popQuestions[numGuessed]
            a1.setTitle(appData.popChoices[numGuessed][0], for: .normal)
            a2.setTitle(appData.popChoices[numGuessed][1], for: .normal)
            a3.setTitle(appData.popChoices[numGuessed][2], for: .normal)
            a4.setTitle(appData.popChoices[numGuessed][3], for: .normal)
            appData.answerText = appData.popAnswers[numGuessed]
        case 1:
            question.text = appData.sportsQuestions[numGuessed]
            appData.questionText = appData.sportsQuestions[numGuessed]
            a1.setTitle(appData.sportsChoices[numGuessed][0], for: .normal)
            a2.setTitle(appData.sportsChoices[numGuessed][1], for: .normal)
            a3.setTitle(appData.sportsChoices[numGuessed][2], for: .normal)
            a4.setTitle(appData.sportsChoices[numGuessed][3], for: .normal)
            appData.answerText = appData.sportsAnswers[numGuessed]
        default:
            question.text = appData.moviesQuestions[numGuessed]
            appData.questionText = appData.moviesQuestions[numGuessed]
            a1.setTitle(appData.moviesChoices[numGuessed][0], for: .normal)
            a2.setTitle(appData.moviesChoices[numGuessed][1], for: .normal)
            a3.setTitle(appData.moviesChoices[numGuessed][2], for: .normal)
            a4.setTitle(appData.moviesChoices[numGuessed][3], for: .normal)
            appData.answerText = appData.moviesAnswers[numGuessed]
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackHome", sender: self)
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
