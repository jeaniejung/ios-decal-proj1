//
//  ViewController.swift
//  ToDoList
//
//  Created by Jeanie Jung on 2/24/16.
//  Copyright © 2016 jeaniejung. All rights reserved.
//

import UIKit

    var model : Model!
    var tableView = UITableViewController()
//ViewController class is a subclass that XCode made for us.
class ToDoListTableViewController: UITableViewController {
    @IBOutlet var tableTasks: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        model = Model()
        tableView = self.tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    @IBAction func unwindToToDoListTableViewController(segue: UIStoryboardSegue) {
    
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //populates your UITableView
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        if model.tasks[indexPath.row].taskCompletedAndNeedToDelete == true {
            model.tasks.removeAtIndex(indexPath.row)
        }
        cell.ToDoListItemLabel.text = model.tasks[indexPath.row].taskTitle //indexPath is of type NSIndexPath
        if model.tasks[indexPath.row].taskCompleted == false {
            cell.accessoryType = .None
        } else if model.tasks[indexPath.row].taskCompleted == true {
            cell.accessoryType = .Checkmark
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfTasksToShow()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        model.tasks.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)

    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark
            {
                cell.accessoryType = .None
                model.killTimer(indexPath.row)
            } else {
                cell.accessoryType = .Checkmark
                model.completeTask(indexPath.row)
            }
        }
    }
    
//    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: (action: UITableViewRowAction!, indexPath: NSIndexPath!))
//        let firstActivityItem = self.products[indexPath.row]
//        
//        let activityViewController = UIActivityViewController
//    }



}

