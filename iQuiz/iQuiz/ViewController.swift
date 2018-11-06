//
//  ViewController.swift
//  iQuiz
//
//  Created by Michelle Ho on 10/29/18.
//  Copyright © 2018 Michelle Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var appData = AppData.shared
    
    
    var subjects = ["Pop Culture", "Sports", "Movies"]
    var descriptions = ["Are you tuned into society?","Test your Sports knowledge","How well do you know your favorite movies?"]
    
    var images = ["pop", "sport", "movie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! CustomTableViewCell
        cell.subject.text = appData.subjects[indexPath.row]
        cell.desc.text = appData.descriptions[indexPath.row]
        cell.imageView?.image = UIImage(named: self.images[indexPath.row])
        cell.imageView?.contentMode = .scaleAspectFit
        
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
        let alert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in
                                        NSLog("\"OK\" pressed.")
        }))
        self.present(alert, animated: true, completion: {
            NSLog("The completion handler fired")
        })
        
    }
    
}

