//
//  TaskManager.swift
//  ToDoApp
//
//  Created by ilya on 22.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

class TaskManager {
    
    var taskCount: Int {
        return tasks.count
    }
    var doneTaskCount: Int {
        return doneTasks.count
    }
    
    private var tasks: [Task] = []
    private var doneTasks: [Task] = []

    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func checkTask(at index: Int) {
        let task = tasks.remove(at: index)
        doneTasks.append(task)
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
    
}
