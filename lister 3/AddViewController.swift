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
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    
    @IBAction func Adder(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = textFeild.text!
        task.important = switcheR.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        
    }

}
