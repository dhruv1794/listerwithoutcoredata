//
//  taskindiViewController.swift
//  lister 3
//
//  Created by Dhruv Mishra on 09/02/17.
//  Copyright © 2017 dhruvinity. All rights reserved.
//

import UIKit

class taskindiViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil
        override func viewDidLoad() {
        super.viewDidLoad()

        
            if task!.important{
                taskLabel.text = "❗️\(task!.name!)"
            }
            else{
                taskLabel.text = task!.name!
            }
            

    }

    @IBAction func completeAction(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
       
        navigationController!.popViewController(animated: true)
        
        
    }

}
