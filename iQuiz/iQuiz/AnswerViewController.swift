//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Michelle Ho on 10/29/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    var appData = AppData.shared
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var reaction: UILabel!
    
    
    var correctAnswer = false
    
    var numGuessed = 0
    var questionCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        appData.numGuessed += 1
        
        question.text = appData.questionText
        answer.text = appData.answerText
        if appData.correctAnswer {
            appData.numRight += 1
        }
        
        reaction.text = appData.correctAnswer ? "Great work!" : "Next Time :("
        
        answer.backgroundColor = appData.correctAnswer ? #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        answer.textColor = UIColor.white
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            nextButtonPressed(sender)
        } else if (sender.direction == .left) {
            appData.numRight = 0
            appData.numGuessed = 0
            performSegue(withIdentifier: "segueBackHome", sender: self)
        }
    }
    

    @IBAction func nextButtonPressed(_ sender: Any) {
        let numGuessed = appData.numGuessed
        print(numGuessed)
        if (numGuessed < appData.categories[appData.topicIndex].questions.count) {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            self.present(destination, animated: true, completion: nil)
        } else {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "FinishedViewController") as! FinishedViewController
            self.present(destination, animated: true, completion: nil)
        }
        
        
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
