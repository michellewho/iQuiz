//
//  ViewController.swift
//  iQuiz
//
//  Created by Michelle Ho on 10/29/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //    open var baseurl = "http://tednewardsandbox.site44.com/questions.json"
    //    open var baseurl = "https://api.myjson.com/bins/llzfu"
    
    @IBOutlet weak var tableView: UITableView!
    var appData = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DispatchQueue.main.async {
            self.getData(baseurl: self.appData.baseurl[0])
        }

        tableView.dataSource = self
        tableView.delegate = self
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeDown.direction = .down
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        print("swipe")
        if (sender.direction == .down) {
            tableView.reloadData()
            print("down")
        }
    }
    
    func getData(baseurl: String) {
        Alamofire.request(baseurl).responseJSON { response in
            if response.response?.statusCode == 200 {
                self.appData.categories.removeAll()
                self.appData.numGuessed = 0
                self.appData.numRight = 0
                
                self.appData.baseurl[0] = baseurl
                let value = response.result.value
                let json = value as! [NSDictionary]
                self.parseJson(json)
            } else {
                print("error")
                self.getLocalData()
            }
        }
    }
    
    func parseJson(_ json: [NSDictionary]) {
        for cat in json {
            let description = cat["desc"] as! String
            let subject = cat["title"] as! String
            var questions = [Question]()
            for questionArr in cat["questions"] as! [AnyObject] {
                let question = questionArr["text"] as! String
                let answer = questionArr["answer"] as! String
                let options = questionArr["answers"] as! [String]
                
                questions.append(Question(question: question, answers: options, correctAnswer: answer))
            }
            appData.categories.append(Category(subject: subject, description: description, questions: questions))
        }
        self.tableView.reloadData()
        saveLocally(json)
    }
    
    func saveLocally(_ json: [NSDictionary]) {
        let defaults = UserDefaults.standard
        defaults.set(json, forKey: "json")
    }
    
    func getLocalData() {
        self.appData.categories.removeAll()
        self.parseJson(UserDefaults.standard.object(forKey: "json") as! [NSDictionary])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appData.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! CustomTableViewCell
        
        if(appData.categories.count > indexPath.row) {
            cell.subject.text = appData.categories[indexPath.row].subject
            cell.desc.text = appData.categories[indexPath.row].description
            cell.imageView?.image = UIImage(named: "party")
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appData.topicIndex = indexPath.row
        performSegue(withIdentifier: "segueGoToQuestion", sender: self)
    }

    @IBAction func settingsPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Enter a URL to see more!", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        alert.addAction(UIAlertAction(title: "Check Now", style: .default, handler: {
            _ in NSLog("\"Check Now\" pressed.")
            self.appData.baseurl[1] = ((alert.textFields![0].text)?.isEmpty)! ? self.appData.baseurl[1] : alert.textFields![0].text!
            self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")
            self.getData(baseurl: self.appData.baseurl[1])
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in NSLog("\"Cancel\" pressed.")}))
        
        self.present(alert, animated: true, completion: {
            NSLog("The completion handler fired")
        })
        
    }
    
}

