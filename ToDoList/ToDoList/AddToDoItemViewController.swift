//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Jeanie Jung on 2/29/16.
//  Copyright © 2016 jeaniejung. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController, UITextFieldDelegate {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    @IBOutlet weak var taskTitle: UITextField!

    
    @IBAction func Done(sender: AnyObject) {
        if taskTitle.text != "" {
            model.addTask(taskTitle.text!)
            self.view.endEditing(true)
            taskTitle.text = ""
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender as! UIBarButtonItem).tag == 1 {
            Done(sender!)
        }
    }

    //Do not use a static model
    //Create your own class that is a model. Array based model that is not static.
    //Use AddToDoItemViewController
    //Have IBActions and IBOutlets used to update your model
    //How to get a reference to the model in the ToDoListTableViewController:
    //1. Make sure you initialize the class only once inside viewDidLoad of ToDoListTableViewController. Note, this method is called only once
    //2. Make a reference to a variable that can pass in "prepare for segue" using the destination view controller
    //3. At AddViewController, add a text field where you can type stuff in. Becuase you should have a reference to this model/text field, update, and update the tableviewcontroller using "reloadData", which calls all the delegate methods e.g. tableView
    //
}

