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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        tableview1.delegate = self
        tableview1.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableview1.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important{
            cell.textLabel?.text = "❗️\(task.name!)"
        }
        else{
            cell.textLabel?.text = task.name!
        }
        
        return cell
    } // to selct a cell and open a segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "taskIndividual", sender: task)
        
        
        
    }

    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "AddSegue", sender: nil)
    }
    
    func getTasks()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch{
            print("error encountered")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "taskIndividual"{
            let nextVC = segue.destination as! taskindiViewController
            nextVC.task = sender as? Task   // sender is coming in as anyobject but for this particular we want sender to be sent as the class object task
            
            
            
            
        }
    }
    
    
    

}

