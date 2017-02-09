//
//  taskindiViewController.swift
//  lister 3
//
//  Created by Dhruv Mishra on 09/02/17.
//  Copyright © 2017 dhruvinity. All rights reserved.
//

import UIKit

class taskindiViewController: UIViewController {
    var previousVC = ViewController()
    @IBOutlet weak var taskLabel: UILabel!
        var task = Task()
        override func viewDidLoad() {
        super.viewDidLoad()

        
            if task.important{
                taskLabel.text = "❗️\(task.name)"
            }
            else{
                taskLabel.text = task.name
            }
            

    }

    @IBAction func completeAction(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableview1.reloadData()
        navigationController!.popViewController(animated: true)
        
        
    }

}
