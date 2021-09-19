//
//  DatabaseHelper.swift
//  Motilal-Task
//
//  Created by Villian Raja on 18/09/21.
//

import Foundation
import UIKit
import CoreData
class DatabaseHelper {
    // Globally used ShareInstance in this Application
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    // save Task Method
    func saveToDoTask(object:[String:String]) {
        let toDoTask = NSEntityDescription.insertNewObject(forEntityName: "ToDoTask", into: context!) as? ToDoTask
        toDoTask?.tittle = object["tittle"]
        toDoTask?.tittleDescription = object["tittleDescription"]
        do {
            try context?.save()
        } catch  {
            debugPrint(error)
        }
    }
    // Fetch Details of Task Method
    func getToDoTaskData() -> [ToDoTask] {
        var toDoTask = [ToDoTask]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDoTask")
        let sort = NSSortDescriptor(key: "tittle", ascending: false)
            fetchRequest.sortDescriptors = [sort]
        do {
            toDoTask = try context?.fetch(fetchRequest) as! [ToDoTask]
        } catch  {
            debugPrint(error)
        }
        return toDoTask
    }
    // Delete DetailsTask Method
    func deleteTask(index:Int) {
        var toDoTask = getToDoTaskData()
        context?.delete(toDoTask[index])
        toDoTask.remove(at: index)
        do {
            try context?.save()
        } catch  {
            debugPrint(error)
        }
    }
    // Update DetailsTask Method
    func edittoDoTaskData(object:[String:String],i:Int) {
        let toDoTask = getToDoTaskData()
        toDoTask[i].tittle = object["tittle"]
        toDoTask[i].tittleDescription = object["tittleDescription"]
        do {
            try context?.save()
        } catch  {
            debugPrint(error)
        }
    }
}
