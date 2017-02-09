//
//  ViewController.swift
//  lister 3
//
//  Created by Dhruv Mishra on 09/02/17.
//  Copyright © 2017 dhruvinity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableview1: UITableView!
    var tasks : [Task] = []
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasks = makeFunc()
        tableview1.delegate = self
        tableview1.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important{
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else{
            cell.textLabel?.text = task.name
        }
        
        return cell
    } // to selct a cell and open a segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "taskIndividual", sender: task)
        
        
        
    }
    func makeFunc() -> [Task]{
        let task1 = Task()
        task1.name = "but a cover for the laptop"
        task1.important  = true
        let task2 = Task()
        task2.name = "collect my provisional"
        task2.important = true
        let task3 = Task()
        task3.name = "read a novel"
        task3.important = false
        return [task1,task2,task3]
    }
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue"
        {
            let nextVC = segue.destination as! AddViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "taskIndividual"{
            let nextVC = segue.destination as! taskindiViewController
            nextVC.task = sender as! Task   // sender is coming in as anyobject but for this particular we want sender to be sent as the class object task
            nextVC.previousVC = self
            
            
            
        }
    }
    
    
    

}

