//
//  TaskViewModel.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import Foundation
import UIKit
import CoreData
class TaskViewModel {
    var taskList = [TodoTaskModel]()
    weak var vc: ViewController?
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    // fetch Tittle and Description from PersistentContainer and append to the model class
    func getTaskData() {
        do {
            guard let result = try context?.fetch(ToDoTask.fetchRequest()) as? [ToDoTask] else {return}
            taskList.removeAll()
            result.forEach { (TodoTask) in
                taskList.append(TodoTask.getTodoTaskModel())
            }
            taskList = taskList.sorted(by: { $0.tittle?.compare($1.tittle!) == .orderedAscending })
            vc?.tableView.reloadData()
        } catch let error {
            debugPrint(error)
        }
    }
}
