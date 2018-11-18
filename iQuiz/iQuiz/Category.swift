//
//  Category.swift
//  iQuiz
//
//  Created by Michelle Ho on 11/15/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import Foundation

class Category {
    var subject: String = ""
    var description: String = ""
//    var image: String = ""
    var questions: [Question]
    
    init(subject: String, description: String, questions: [Question]) {
        self.subject = subject
        self.description = description
//        self.image = image
        self.questions = questions
    }
    
}
