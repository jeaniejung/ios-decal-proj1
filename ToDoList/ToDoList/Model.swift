//
//  Model.swift
//  ToDoList
//
//  Created by Jeanie Jung on 2/29/16.
//  Copyright © 2016 jeaniejung. All rights reserved.
//

import UIKit

struct task {
    var taskTitle = ""
    var taskCompleted = false
    var taskCompletedAndNeedToDelete = false
    var timer = NSTimer()
}

class Model: NSObject {
    var tasks = [task]()
    func addTask(taskTitle: String) {
        self.tasks.append(task(taskTitle: taskTitle, taskCompleted: false, taskCompletedAndNeedToDelete: false, timer: NSTimer()))
    }
    func killTimer(x: Int) {
        tasks[x].timer = NSTimer()
        tasks[x].taskCompleted = false
        tasks[x].taskCompletedAndNeedToDelete = false
    }
    func numberOfTasksCompleted() -> Int {
        var numberOfTasksCompleted = 0
        for task in tasks {
            if task.taskCompleted == true && task.taskCompletedAndNeedToDelete == false{
                numberOfTasksCompleted = numberOfTasksCompleted + 1
            }
        }
        return numberOfTasksCompleted
    }
    func completeTask(x: Int) {
        tasks[x].timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("deleteTask:"), userInfo: nil, repeats: false)
        tasks[x].taskCompleted = true
    }
    func deleteTask(timer: NSTimer) {
        for index in 1...tasks.count {
            if tasks[index - 1].timer == timer {
                tasks[index - 1].taskCompletedAndNeedToDelete = true
            }
        }
    }
    func numberOfTasksToShow() -> Int {
        var numberOfTasksToShow = 0
        for task in tasks {
            if task.taskCompletedAndNeedToDelete == false {
                numberOfTasksToShow = numberOfTasksToShow + 1
            }
        }
        return numberOfTasksToShow
        
    }

}


