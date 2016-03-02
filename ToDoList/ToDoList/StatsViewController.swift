//
//  EditToDoItemViewController.swift
//  ToDoList
//
//  Created by Jeanie Jung on 3/1/16.
//  Copyright © 2016 jeaniejung. All rights reserved.
//

import UIKit

class StatsViewController:UIViewController {
    
    @IBOutlet weak var numberOfTasksCompleted: UILabel!
    override func viewWillAppear(animated: Bool) {
        numberOfTasksCompleted.text = String(model.numberOfTasksCompleted())
    }
}