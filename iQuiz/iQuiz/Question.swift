//
//  Question.swift
//  iQuiz
//
//  Created by Michelle Ho on 11/15/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import Foundation

class Question {
    var question : String = ""
    var answers : [String] = []
    var correctAnswer : String = ""
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
