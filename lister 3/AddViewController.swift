//
//  AddViewController.swift
//  lister 3
//
//  Created by Dhruv Mishra on 09/02/17.
//  Copyright © 2017 dhruvinity. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var switcheR: UISwitch!
    var previousVC = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    
    @IBAction func Adder(_ sender: Any) {
        let task = Task()
        task.name = textFeild.text!
        task.important = switcheR.isOn
        previousVC.tasks.append(task)
        previousVC.tableview1.reloadData()// to append data onto the table view
        navigationController!.popViewController(animated: true)
        
        
    }

}
