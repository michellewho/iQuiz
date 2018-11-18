//
//  AppData.swift
//  iQuiz
//
//  Created by Michelle Ho on 10/29/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//
import Alamofire
import UIKit

class AppData: NSObject {
    static var shared = AppData()
    
    open var categories : [Category] = []
    
//    open var baseurl = "http://tednewardsandbox.site44.com/questions.json"
//    open var baseurl = "https://api.myjson.com/bins/llzfu"
    open var baseurl = ["http://tednewardsandbox.site44.com/questions.json", ""]
    
    open var topicIndex = 0
    open var numGuessed = 0
    open var numRight = 0
    
    open var questionText = ""
    open var answerText = ""
    open var correctAnswer = false
    
//    open var subjects = ["Pop Culture", "Sports", "Movies"]
//    open var descriptions = ["Are you tuned into society?","Test your Sports knowledge","How well do you know your favorite movies?"]
//    open var images = ["pop", "sport", "movie"]
//    
//    open var popQuestions: [String] = ["Who is Serena Williams married to?", "What is Kylie Jenner's baby's name?", "What is Kanye West's newest album called?", "How old is Donald Trump?"]
//    open var sportsQuestions: [String] = ["What was the score of the UW vs. Stanford game on Nov 3, 2018?", "What team does Stephen Curry's brother play for?", "What was Eliud Kipchoge's winning time in Nike's project, Breaking2?", "Who owns the Golden State Warriors?"]
//    open var moviesQuestions: [String] = ["Who was the first Disney princess?", "What is the name of the first Harry Potter book?", "What movie stars Lady Gaga and Bradley Cooper?", "What year was Forrest Gump released?"]
//
//
//    open var popChoices: [[String]] = [["Alexis Ohanian", "Rafael Nadal", "Tristan Thompson", "Jordan Evans"], ["North", "Winnie", "Stormi", "Aaron"], ["Yeezus", "Ye", "Late Registration", "Yandhi"], ["75", "80", "72", "82"]]
//    open var sportsChoices: [[String]] = [["27-23", "26-21", "14-7", "21-21"], ["Boston Celtics", "Portland Trail Blazers", "Houston Rockets", "None of the Above"], ["2:00:03", "1:59:58", "2:00:25", "2:01:01"], ["Elon Musk", "Tony Ressler", "Jerry Reinsdorf", "Joe Lacob"]]
//    open var moviesChoices: [[String]] = [["Persephone", "Snow White", "Ariel", "Cinderella"], ["Harry Potter and the Sorcerer's Stone", "Harry Potter and the Philosopher's Stone", "Harry Potter and the Emperor's Stone", "Harry Potter and the Magical Stone"], ["One Hit Wonder", "A Star is Born", "The Loving Country", "Four More Tries"], ["1997", "1995", "1993", "1994"]]
//
//
//    open var popAnswers: [String] = ["Alexis Ohanian", "Stormi", "Yandhi", "72"]
//    open var sportsAnswers: [String] = ["27-23", "Portland Trail Blazers", "2:00:25", "Joe Lacob"]
//    open var moviesAnswers: [String] = ["Persephone", "Harry Potter and the Philosopher's Stone", "A Star is Born", "1994"]
//
    

    
}
